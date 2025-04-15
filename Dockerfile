# Build stage
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
COPY .env .
RUN mvn clean package -DskipTests

# Runtime stage
FROM amazoncorretto:17

# Load environment variables from .env file
ARG PROFILE
ARG APP_VERSION
ENV PROFILE=${PROFILE:-prod}
ENV APP_VERSION=${APP_VERSION:-0.0.1-SNAPSHOT}

WORKDIR /app
COPY --from=build /build/target/LabManagement-*.jar /app/
COPY --from=build /build/.env /app/

EXPOSE ${SPRINGBOOT_CONTAINER_PORT}

# Environment variables needed for the application
ENV MYSQL_HOST=${MYSQL_HOST:-mysql}
ENV MYSQL_PORT=${MYSQL_PORT:-3306}
ENV MYSQL_DATABASE=${MYSQL_DATABASE:-lab_management}
ENV MYSQL_USERNAME=${MYSQL_USERNAME:-root}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD:-cse123456}
ENV DB_URL=${DB_URL:-jdbc:mysql://${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE}?serverTimezone=Asia/Ho_Chi_Minh&allowPublicKeyRetrieval=true&useSSL=false}
ENV ACTIVE_PROFILE=${PROFILE:-dev}
ENV JAR_VERSION=${APP_VERSION:-0.0.1-SNAPSHOT}
ENV EMAIL_HOSTNAME=${EMAIL_HOSTNAME}
ENV EMAIL_USERNAME=${EMAIL_USERNAME}
ENV EMAIL_PASSWORD=${EMAIL_PASSWORD}
ENV JWT_SECRET_KEY=${JWT_SECRET_KEY}

CMD java -jar \
    -Dspring.profiles.active=${ACTIVE_PROFILE} \
    -Dspring.datasource.url=${DB_URL} \
    -Dspring.datasource.username=${MYSQL_USERNAME} \
    -Dspring.datasource.password=${MYSQL_PASSWORD} \
    -Dapplication.security.jwt.secret-key=${JWT_SECRET_KEY} \
    LabManagement-${JAR_VERSION}.jar
