# Stage 1: Build the Spring Boot application
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy the project's pom.xml file
COPY pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline

# Copy the project source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Stage 2: Create the Tomcat container and deploy the application
FROM tomcat:9.0.54-jdk11-openjdk

# Remove the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file from the build stage to the webapps directory
COPY --from=build /app/target/hello-world-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
