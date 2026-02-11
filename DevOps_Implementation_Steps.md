# 🚀 Real DevOps Implementation: Step-by-Step Guide (Ubuntu)

This guide provides the exact commands and configurations needed to set up a professional CI/CD pipeline across 4 separate Ubuntu instances.

---

<details>
<summary><b>🛠️ Step 1: Jenkins Server Setup (Server 1)</b></summary>

### Tasks:
1. **Update System:**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
2. **Install Java 11:**
   ```bash
   sudo apt install openjdk-11-jdk -y
   ```
3. **Install Jenkins:**
   ```bash
   curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.gpg > /dev/null
   echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
   sudo apt update
   sudo apt install jenkins -y
   ```
4. **Start & Enable Jenkins:**
   ```bash
   sudo systemctl start jenkins
   sudo systemctl enable jenkins
   ```
5. **Access UI:** Open `http://<Internal-IP>:8080` and unlock using:
   ```bash
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```
</details>

<details>
<summary><b>🐯 Step 2: Tomcat Server Setup (Server 2)</b></summary>

### Tasks:
1. **Install Java:**
   ```bash
   sudo apt update && sudo apt install openjdk-11-jdk -y
   ```
2. **Setup User & Directory:**
   ```bash
   sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat
   ```
3. **Download Tomcat 9:**
   ```bash
   cd /tmp
   wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz
   sudo tar xzvf apache-tomcat-9.0.62.tar.gz -C /opt/tomcat --strip-components=1
   ```
4. **Fix Permissions:**
   ```bash
   sudo chown -R tomcat:tomcat /opt/tomcat/
   sudo chmod -R +x /opt/tomcat/bin
   ```
</details>

<details>
<summary><b>🤖 Step 3: Ansible Control Node Setup (Server 3)</b></summary>

### Tasks:
1. **Install Ansible:**
   ```bash
   sudo apt update
   sudo apt install software-properties-common -y
   sudo add-apt-repository --yes --update ppa:ansible/ansible
   sudo apt install ansible -y
   ```
2. **Create Admin User:**
   ```bash
   sudo useradd ansadmin
   sudo passwd ansadmin
   echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
   ```
3. **Enable Password Login:**
   Edit `/etc/ssh/sshd_config` and set `PasswordAuthentication yes`.
   ```bash
   sudo systemctl reload ssh
   ```
4. **Generate SSH Keys:**
   ```bash
   su - ansadmin
   ssh-keygen -t rsa
   ```
</details>

<details>
<summary><b>🐳 Step 4: Docker Target Host Setup (Server 4)</b></summary>

### Tasks:
1. **Install Docker CE:**
   ```bash
   sudo apt update
   sudo apt install ca-certificates curl gnupg lsb-release -y
   sudo mkdir -p /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt update
   sudo apt install docker-ce docker-ce-cli containerd.io -y
   ```
2. **Integrate with Ansible:**
   Perform Step 3 (Tasks 2 & 3) on this server as well to allow Ansible connection.
</details>

<details>
<summary><b>☸️ Step 5: Kubernetes (EKS) Bootstrap Server</b></summary>

### Tasks:
1. **Install AWS CLI & kubectl:**
   ```bash
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ```
2. **Setup eksctl:**
   ```bash
   curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
   sudo mv /tmp/eksctl /usr/local/bin
   ```
3. **IAM Configuration:** Ensure EC2 has an IAM Role with AdministratorAccess (or specific EKS/EC2/CF permissions).
</details>

---

> [!IMPORTANT]
> **Real DevOps Security Rule**: Always perform `ssh-copy-id ansadmin@<Server-IP>` from the Ansible Server to all other nodes to enable passwordless automation.

---
*Follow these steps sequentially to build your real-world pipeline.*
