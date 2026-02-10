# 🐳 Node 4: Docker Target Host Setup

Run these commands on your **Docker Host EC2 Instance (Ubuntu)**.

---

### 1. Install Docker CE
```bash
sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
```

### 2. Setup Admin User (ansadmin)
*Required for Ansible to manage this node remotely.*
```bash
sudo useradd ansadmin
sudo passwd ansadmin
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```

### 3. Configure SSH for Ansible
```bash
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl reload ssh
```

### 4. Add User to Docker Group
```bash
sudo usermod -aG docker ansadmin
```

> [!NOTE]
> Ansible will now be able to run Docker commands on this host using the `ansadmin` user.
