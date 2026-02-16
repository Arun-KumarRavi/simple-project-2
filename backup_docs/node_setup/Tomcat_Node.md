# 🚢 Node 2: Tomcat Deployment Server Setup (Official Guide)

Dedicated server for legacy WAR file deployments and Tomcat Manager integration.

________________________________________
### Tomcat Installation on Ubuntu EC2

#### Step 1: Install OpenJDK 11
```bash
sudo apt update 
sudo apt install openjdk-11-jdk -y 
java -version
```
________________________________________
#### Step 2: Create Tomcat User
```bash
sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat 
```
________________________________________
#### Step 3: Download and Install Tomcat 9
```bash
cd /tmp 
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz 
sudo mkdir -p /opt/tomcat
sudo tar xzvf apache-tomcat-9.0.62.tar.gz -C /opt/tomcat --strip-components=1 
```
________________________________________
#### Step 4: Set Permissions
```bash
sudo chown -R tomcat:tomcat /opt/tomcat 
sudo chmod -R +x /opt/tomcat/bin 
```
________________________________________
#### Step 5: Start Tomcat
```bash
sudo -u tomcat /opt/tomcat/bin/startup.sh 
```
- **Test in browser**: `http://<EC2-PUBLIC-IP>:8080`

________________________________________
### TOMCAT MANAGER

#### Step 6: Configure Tomcat Manager User (For Jenkins)
Edit users file:
```bash
sudo nano /opt/tomcat/conf/tomcat-users.xml
```
Replace the content with: 
```xml
<?xml version="1.0" encoding="UTF-8"?> 
<tomcat-users xmlns="http://tomcat.apache.org/xml" 
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd" 
              version="1.0"> 
 
  <role rolename="manager-gui"/> 
  <role rolename="manager-script"/> 
 
  <user username="admin" password="password" 
        roles="manager-gui,manager-script"/> 
 
</tomcat-users>
```
________________________________________
#### Step 7: Allow Remote Access to Manager
Edit both files.

**Manager App:**
```bash
sudo nano /opt/tomcat/webapps/manager/META-INF/context.xml 
```
**Host Manager App:**
```bash
sudo nano /opt/tomcat/webapps/host-manager/META-INF/context.xml 
```
Replace the content with:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context antiResourceLocking="false" privileged="true" >
    <!--
    <Valve className="org.apache.catalina.valves.RemoteAddrValve"
           allow="127\.\d+\.\d+\.\d+|::1"/>
    -->
</Context>
```
________________________________________
#### Step 8: Restart Tomcat
```bash
sudo pkill -f tomcat 
sudo -u tomcat /opt/tomcat/bin/startup.sh 
```
- **Access Manager UI**: `http://<EC2-PUBLIC-IP>:8080/manager/html`
- **Login**: `admin` / `password`

________________________________________
### Step 9: Admin User Configuration (For Ansible)
*Required for Stage 3 automation.*
```bash
sudo useradd -m -s /bin/bash ansadmin
echo "ansadmin:password" | sudo chpasswd
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```
