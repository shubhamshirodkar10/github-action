FROM maven:3.9.14-eclipse-temurin-17-alpine as builder
WORKDIR /application
COPY . .
RUN mvn clean package

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /apps
COPY --from=builder /application/target/*.jar /apps/app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
