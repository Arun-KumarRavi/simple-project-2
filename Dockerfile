# Build Stage
FROM maven:3.8.3-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Run Stage
FROM tomcat:9.0-jdk11-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/hello-world.war /usr/local/tomcat/webapps/hello-world.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
