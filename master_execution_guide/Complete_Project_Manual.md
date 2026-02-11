# 📘 Complete Project Manual: High-Fidelity DevOps Pipeline

This manual is your single source of truth for completing the DevOps project. Follow every step exactly as written to achieve a 100% successful deployment.

---

## 🏗️ Chapter 1: Infrastructure Provisioning (AWS)

You must launch **4 EC2 Instances** using **Ubuntu 22.04 LTS**.

### **Server Settings:**
| Server Name | Instance Type | Security Group Ports |
| :--- | :--- | :--- |
| **Jenkins-Server** | t2.medium | 22 (SSH), 8080 (Jenkins) |
| **Tomcat-Server** | t2.micro | 22 (SSH), 8080 (Tomcat) |
| **Ansible-Node** | t2.micro | 22 (SSH) |
| **Docker-Host** | t2.micro | 22 (SSH), 8080 (Docker App) |

---

## 🛠️ Chapter 2: Software Installation

For each server, follow the commands in the `nodes/` folder of this project:

1.  **On Jenkins-Server**: Run `nodes/Jenkins_Node.md`.
2.  **On Tomcat-Server**: Run `nodes/Tomcat_Node.md`.
3.  **On Ansible-Node**: Run `nodes/Ansible_Node.md`.
4.  **On Docker-Host**: Run `nodes/Docker_Node.md`.

---

## 🔑 Chapter 3: The SSH "Trust" Configuration

Ansible needs to talk to the other servers without a password.

1.  **On ALL 4 Servers**:
    ```bash
    sudo useradd ansadmin
    sudo passwd ansadmin
    echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
    sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
    sudo systemctl reload ssh
    ```
2.  **On Ansible-Node (Switch to ansadmin)**:
    ```bash
    su - ansadmin
    ssh-keygen -t rsa   # Press Enter for all prompts
    ssh-copy-id ansadmin@<Tomcat-Server-IP>
    ssh-copy-id ansadmin@<Docker-Host-IP>
    ```

---

## 🏗️ Chapter 4: Jenkins Configuration

1.  **Unlock**: Get password from `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`.
2.  **Install Plugins**: Go to *Manage Jenkins* -> *Plugins* -> *Available* and install:
    - GitHub Integration
    - Maven Integration
    - Publish Over SSH
3.  **Setup Tools**: Go to *Manage Jenkins* -> *Global Tool Configuration*:
    - Add **JDK** (Java Home: `/usr/lib/jvm/java-11-openjdk-amd64`)
    - Add **Maven** (Install automatically)

---

## 🚀 Chapter 5: Stage-by-Stage Execution

### **Stage 1: Tomcat Deploy**
Create a **Maven Project** in Jenkins. Use `deploy to container` post-build action using the Tomcat IP and credentials.

### **Stage 2: Docker Hub**
Build the Docker image using the `Dockerfile` provided in the project root.
`docker build -t your-username/hello-world .`

### **Stage 3: Ansible Automation**
1. On **Ansible-Node**, create a file named `hosts`:
   ```ini
   [dockerhost]
   <Docker-Host-IP>
   ```
2. Run the playbook:
   ```bash
   ansible-playbook -i hosts code/deploy_app.yml
   ```

---

## 🌟 Chapter 6: Troubleshooting (No Error Zone)

- **Connection Refused?** Check if the service (Jenkins/Tomcat) is running: `sudo systemctl status <service>`.
- **Permission Denied?** Ensure you are running commands as `ansadmin` for Ansible tasks.
- **Port Busy?** Ensure no other app is using port 8080.

---
> [!IMPORTANT]
> Always verify the **Public IP** of your instances after a restart, as they may change unless you use Elastic IPs.

---
*Congratulations! You have followed the complete DevOps blueprint.*
