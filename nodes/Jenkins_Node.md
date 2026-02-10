# 🛠️ Node 1: Jenkins CI Server Setup

Run these commands on your **Jenkins EC2 Instance (Ubuntu)**.

---

### 1. System Update
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install OpenJDK 11
```bash
sudo apt install openjdk-11-jdk -y
java -version
```

### 3. Install Jenkins
```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.gpg > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
```

### 4. Service Management
```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
```

### 5. Unlock Jenkins
Get your initial admin password:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

> [!NOTE]
> Ensure Port **8080** is open in your AWS Security Group.
