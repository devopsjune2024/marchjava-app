FROM maven:3.9.9-amazoncorretto-17-al2023 AS builder
COPY . /app
WORKDIR /app
EXPOSE 8080
USER root
RUN mvn clean install -DskipTests

FROM openjdk:17-alpine as stage
USER root
COPY --from=builder /app/target/devops-app-1.0-SNAPSHOT.jar /app/devops-app-1.0-SNAPSHOT.jar
CMD java -jar /app/devops-app-1.0-SNAPSHOT.jar
