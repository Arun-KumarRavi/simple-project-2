# 🐳 Docker Host Node Setup (Gold Standard)

The container runtime environment for your application.

### 1. Install Docker Engine
```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```

### 2. Admin Permissions (Crucial for Ansible)
Without these, Ansible will get "Permission Denied" errors.
```bash
sudo useradd -m -s /bin/bash ansadmin
sudo passwd ansadmin
sudo usermod -aG docker ansadmin
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```

### 3. Python-Docker Bridge
Required for Ansible to control Docker containers remotely.
```bash
sudo apt update
sudo apt install python3-docker -y
```

### 4. Verification
```bash
su - ansadmin
docker ps
# Should return empty container list without sudo
```
