# 🎯 Stage 1: Build & Deploy to Tomcat

This stage automates the process of taking Java source code and running it on a web server.

### 1. Source Code Integration
- **Repo**: `https://github.com/Arun-KumarRavi/simple-project-2.git`
- Ensure your code has a `pom.xml` for Maven to build.

### 2. Jenkins Job Configuration
1.  **Job Type**: Maven Project.
2.  **Source Code Management**: Git (Enter repository URL).
3.  **Build Triggers**: (Optional) Poll SCM or GitHub hook.
4.  **Goals and Options**: `clean install`.

### 3. "Deploy to Container" Step
1.  **Post-build Action**: "Deploy war/ear to a container".
2.  **WAR file**: `webapp/target/hello-world.war`.
3.  **Context Path**: `/hello-world`.
4.  **Container**: Tomcat 9.x.
5.  **Manager URL**: `http://<Tomcat-IP>:8080`.
6.  **Credentials**: Manager GUI credentials from `tomcat-users.xml`.

### 4. Verification
Build the job in Jenkins. Visit: `http://<Tomcat-IP>:8080/hello-world/`
