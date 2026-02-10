# Step 1: Build the application using Maven
FROM maven:3.8.1-openjdk-11 AS build
WORKDIR /app
COPY webapp/pom.xml .
COPY webapp/src ./src
RUN mvn clean package

# Step 2: Deploy to Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim
COPY --from=build /app/target/hello-world.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
