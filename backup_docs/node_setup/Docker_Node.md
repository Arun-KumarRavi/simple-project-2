# 🐳 Node 4: Docker Host Node Setup (Official Guide)

The container runtime environment where your application will live in Stage 2 & 3.

________________________________________
### Docker Installation on Ubuntu EC2

#### Step 1: Install Docker Engine
```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```
________________________________________
#### Step 2: Set Permissions (Crucial for Ansible)
Without these, Ansible will get "Permission Denied" errors when running containers.
```bash
sudo useradd -m -s /bin/bash ansadmin
echo "ansadmin:password" | sudo chpasswd
sudo usermod -aG docker ansadmin
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```
________________________________________
#### Step 3: Python-Docker Bridge (PEP 668 Fix)
Required for Ansible to control Docker containers remotely without dependency issues.
```bash
sudo apt update
sudo apt install python3-docker -y
```
________________________________________
#### Step 4: Verify Installation
```bash
su - ansadmin
docker ps
# Should return an empty container list without needing 'sudo'
```
