# 🤖 Node 3: Ansible Control Node Setup

Run these commands on your **Ansible Control EC2 Instance (Ubuntu)**.

---

### 1. Install Ansible
```bash
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
```

### 2. Setup Admin User (ansadmin)
```bash
# Create user with home directory and bash shell
sudo useradd -m -s /bin/bash ansadmin
sudo passwd ansadmin
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```

### 3. Configure SSH for Automation
Edit the SSH config to allow password-based login for key exchange:
```bash
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl reload ssh
```

### 4. Generate Keys (as ansadmin)
```bash
su - ansadmin
ssh-keygen -t rsa
```

> [!IMPORTANT]
> Use `ssh-copy-id ansadmin@<Target-IP>` to trust your target nodes.

---

### 🚀 Stage 3: Docker Automation with Ansible

Follow these steps on your **Ansible Control Node** to automate the Docker deployment.

#### **1. Install Required Ansible Collections**
Ansible needs a specific module to talk to Docker:
```bash
ansible-galaxy collection install community.docker
```

#### **2. Prepare the Docker Host (Target Node)**
Ansible uses Python to manage Docker. Run this **on the Docker Host**:
```bash
sudo apt update
sudo apt install python3-docker -y
```

#### **3. Create/Update Inventory**
Ensure your Docker Host is listed in `/etc/ansible/hosts`:
```bash
sudo vi /etc/ansible/hosts
```
Add (if not there):
```ini
[dockerhost]
<Your-Docker-Host-IP>
```

#### **4. Execute the Playbook**
Go to your project folder and run:
```bash
cd ~/simple-project-2/code
ansible-playbook -i /etc/ansible/hosts deploy_app.yml
```

---

### 🏆 **The "Gold Standard" Automation Flow (Stage 3)**
If you want to run this from scratch next time without any errors, here is the perfect sequence:

| Node | Action | Command |
| :--- | :--- | :--- |
| **Ansible Node** | Install Docker Module | `ansible-galaxy collection install community.docker` |
| **Docker Host** | Install Python Bridge | `sudo apt update && sudo apt install python3-docker -y` |
| **Docker Host** | Fix Permissions | `sudo usermod -aG docker ansadmin` |
| **Ansible Node** | Run Automation | `ansible-playbook -i /etc/ansible/hosts deploy_app.yml` |

---

### 🛡️ Troubleshooting "Access Denied" or Permission Errors

If `ssh-copy-id` fails, run these fix commands **on the Target Node** (not the Ansible server):

#### **1. Missing Home Directory Fix**
If you see "can't cd to /home/ansadmin":
```bash
sudo mkdir -p /home/ansadmin
sudo chown ansadmin:ansadmin /home/ansadmin
```

#### **2. SSH Config Overrides Fix**
Ubuntu often has extra config files blocking passwords. Force them to allow it:
```bash
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/*.conf
sudo systemctl restart ssh
```
