# 🐯 Node 2: Tomcat Deployment Server Setup

Run these commands on your **Tomcat EC2 Instance (Ubuntu)**.

---

### 1. Install OpenJDK 11
```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
```

### 2. Configure Tomcat User
```bash
sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat
```

### 3. Download and Install Tomcat 9
```bash
cd /tmp
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz
sudo tar xzvf apache-tomcat-9.0.62.tar.gz -C /opt/tomcat --strip-components=1
```

### 4. Permissions
```bash
sudo chown -R tomcat:tomcat /opt/tomcat/
sudo chmod -R +x /opt/tomcat/bin
```

### 5. Start Tomcat
```bash
sudo -u tomcat /opt/tomcat/bin/startup.sh
```

### 6. Enable Tomcat Manager (For Jenkins)
Jenkins needs a "manager-script" user to deploy your code.
Run this command:
```bash
sudo nano /opt/tomcat/conf/tomcat-users.xml
```
Add this before the `</tomcat-users>` line:
```xml
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="admin" password="password" roles="manager-gui,manager-script"/>
```

### 7. Allow Remote Access
By default, Tomcat blocks external computers from the Manager UI. Run these two commands to allow Jenkins:

**Manager App:**
```bash
sudo sed -i 's/<Valve /<!-- <Valve /' /opt/tomcat/webapps/manager/META-INF/context.xml
sudo sed -i 's/remoteAddrValve" \/>/remoteAddrValve" \/> -->/' /opt/tomcat/webapps/manager/META-INF/context.xml
```

**Host Manager App:**
```bash
sudo sed -i 's/<Valve /<!-- <Valve /' /opt/tomcat/webapps/host-manager/META-INF/context.xml
sudo sed -i 's/remoteAddrValve" \/>/remoteAddrValve" \/> -->/' /opt/tomcat/webapps/host-manager/META-INF/context.xml
```

### 8. Restart Tomcat
```bash
sudo -u tomcat /opt/tomcat/bin/shutdown.sh
sudo -u tomcat /opt/tomcat/bin/startup.sh
```

> [!NOTE]
> Ensure Port **8080** is open in your AWS Security Group.
