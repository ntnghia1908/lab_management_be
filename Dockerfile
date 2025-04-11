# Build stage
FROM maven:3.8.7-openjdk-18 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
COPY .env .
RUN mvn clean package -DskipTests

# Runtime state
FROM amazoncorretto:17
ARG PROFILE=prod
ARG APP_VERSION=0.0.1-SNAPSHOT
#Define new things

WORKDIR /app
COPY --from=build /build/target/LabManagement-*.jar /app/
COPY --from=build /build/.env /app/

EXPOSE 8088

ENV DB_URL=jdbc:mysql://mysql-lab:3306/lab_management
ENV ACTIVE_PROFILE=${PROFILE}
ENV JAR_VERSION=${APP_VERSION}
ENV EMAIL_HOSTNAME=smtp.gmail.com
ENV EMAIL_USERNAME=testdev01112002@gmail.com
ENV EMAIL_PASSWORD=sgxklrzfsgeklpyd
ENV JWT_SECRET_KEY=7Zsxk9MyF3nQ8wL5tB1jH6cR0sA3dV4pE2gW8rK5mN7vX9qP4zT6bY3uJ2hC9

CMD java -jar \
    -Dspring.profiles.active=${ACTIVE_PROFILE} \
    -Dspring.datasource.url=${DB_URL} \
    -Dapplication.security.jwt.secret-key=${JWT_SECRET_KEY} \
    LabManagement-${JAR_VERSION}.jar
