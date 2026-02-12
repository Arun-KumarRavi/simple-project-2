# 🚢 Tomcat Node Setup (Gold Standard)

Dedicated server for legacy WAR file deployments.

### 1. Java Installation
```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
```

### 2. Tomcat Installation
```bash
# Download and unzip Tomcat 9
cd /opt
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
sudo tar -xvf apache-tomcat-9.0.73.tar.gz
sudo mv apache-tomcat-9.0.73 tomcat
```

### 3. Admin User & Permissions
```bash
sudo useradd -m -s /bin/bash ansadmin
sudo passwd ansadmin
sudo chown -R ansadmin:ansadmin /opt/tomcat
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```

### 4. Start Tomcat
```bash
su - ansadmin
/opt/tomcat/bin/startup.sh
```
- Access via: `http://<Tomcat-IP>:8080`
