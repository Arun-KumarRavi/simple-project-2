# 🐳 Stage 2: Docker Containerization

This stage packages your application into a portable "Docker Image" and pushes it to the cloud.

### 1. The Fixed Dockerfile (Gold Standard)
Use the `Temurin` image to fix the "NullPointerException" crash found in OpenJDK 11.
```dockerfile
# Build Stage
FROM maven:3.8.3-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Run Stage
FROM tomcat:9.0-jdk11-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/webapp/target/hello-world.war /usr/local/tomcat/webapps/hello-world.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
```

### 2. Jenkins Integration
Add these "Execute Shell" steps to your Jenkins Build:
```bash
# Login to Docker Hub
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin

# Build and Push
docker build -t <your-id>/hello-world:latest .
docker push <your-id>/hello-world:latest
```

### 3. Verification
Run the container on any Docker host:
```bash
docker run -d -p 8080:8080 --name my-app <your-id>/hello-world:latest
```
Visit: `http://<Docker-Host-IP>:8080/hello-world/`
