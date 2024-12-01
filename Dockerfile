# Step 1: Build the JAR using Maven or Gradle
FROM maven:3.9.9-ibm-semeru-23-jammy as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: Create the runtime image
FROM openjdk:17-oracle
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]