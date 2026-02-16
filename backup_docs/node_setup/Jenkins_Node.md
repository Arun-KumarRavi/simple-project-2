# 🏗️ Jenkins Node Setup (Gold Standard - Ubuntu 24.04/22.04)

This node acts as the **Heart** of your CI/CD pipeline.

________________________________________
### Jenkins Installation on Ubuntu (24.04 / 22.04)

#### Step 1: Update System
```bash
sudo apt update -y
```
________________________________________
#### Step 2: Install Java (Mandatory)
Jenkins requires Java 21.
```bash
sudo apt install fontconfig openjdk-21-jre -y
java -version
```
Expected output (similar):
`openjdk 21.x.x`
⚠️ **Always install Java before Jenkins.**
________________________________________
#### Step 3: Add Jenkins Repository (LTS – Recommended)
```bash
sudo mkdir -p /etc/apt/keyrings

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
```
> [!NOTE]
> *Note: I've kept the official `2023.key` URL as `2026.key` does not yet exist on the official server, but kept your requested structure.*
________________________________________
#### Step 4: Install Jenkins
```bash
sudo apt update
sudo apt install jenkins -y
```
________________________________________
#### Step 5: Start & Enable Jenkins
```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
```
You should see:
`Active: active (running)`
________________________________________
#### Step 6: Open Jenkins Port (AWS EC2 Only)
In AWS Security Group, allow:
- • **Custom TCP**
- • **Port**: 8080
- • **Source**: 0.0.0.0/0

Then open in browser:
`http://<EC2-PUBLIC-IP>:8080`
________________________________________
#### Step 7: Unlock Jenkins
Get initial password:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
Copy and paste into browser.

---

### Step 8: Admin User Configuration (For Ansible)
```bash
sudo useradd -m -s /bin/bash ansadmin
echo "ansadmin:password" | sudo chpasswd
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```

### Step 9: Install Maven
```bash
sudo apt install maven -y
mvn -version
```
