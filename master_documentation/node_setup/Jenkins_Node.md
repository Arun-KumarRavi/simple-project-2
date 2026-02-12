# 🏗️ Jenkins Node Setup (Gold Standard)

This node acts as the **Heart** of your CI/CD pipeline.

### 1. Java Installation (Prerequisite)
```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
java -version
```

### 2. Jenkins Installation
```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

### 3. Maven Installation
```bash
sudo apt install maven -y
mvn -version
```

### 4. Admin User Configuration
```bash
sudo useradd -m -s /bin/bash ansadmin
sudo passwd ansadmin
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```

### 5. Final Jenkins UI Steps
- Port: `8080`
- Unlock Code: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
- **Recommended Plugins**: Git, Maven Integration, Pipeline, Publish Over SSH, Docker Pipeline, Docker.
