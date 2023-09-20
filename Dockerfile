# Use a base image optimized for ARM64 architecture
FROM adoptopenjdk:11-jdk-hotspot-bionic

# Set the working directory inside the container
WORKDIR /app

# Copy your Spring Boot application's source code (pom.xml and src) into the container
COPY pom.xml .
COPY src src
# Install Maven
RUN apt-get update && apt-get install -y maven

# Build your Spring Boot application using Maven
RUN mvn package -DskipTests
# Expose the port your Spring Boot application runs on (typically 8080)
EXPOSE 8080

RUN ls * -r    
# Copy the built JAR file into the container

# Define the entry point command to run your Spring Boot application
CMD ["java", "-jar", "target/app-0.0.1-RC.jar"]
