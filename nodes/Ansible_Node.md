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
