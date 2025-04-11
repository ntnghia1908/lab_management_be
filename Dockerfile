# Build stage
FROM maven:3.8.7-openjdk-18 AS build
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

# Load environment variables from .env file
ENV DB_URL=${DB_URL}
ENV ACTIVE_PROFILE=${PROFILE}
ENV JAR_VERSION=${APP_VERSION}
ENV EMAIL_HOSTNAME=${EMAIL_HOSTNAME}
ENV EMAIL_USERNAME=${EMAIL_USERNAME}
ENV EMAIL_PASSWORD=${EMAIL_PASSWORD}
ENV JWT_SECRET_KEY=${JWT_SECRET_KEY}

CMD java -jar \
    -Dspring.profiles.active=${ACTIVE_PROFILE} \
    -Dspring.datasource.url=${DB_URL} \
    -Dapplication.security.jwt.secret-key=${JWT_SECRET_KEY} \
    LabManagement-${JAR_VERSION}.jar
