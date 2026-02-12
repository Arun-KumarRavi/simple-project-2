# 🤖 Ansible Control Node Setup (Gold Standard)

The decentralized "Brain" that manages all other servers.

### 1. Ansible Core Installation
```bash
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
```

### 2. Admin User & SSH Config
```bash
sudo useradd -m -s /bin/bash ansadmin
sudo passwd ansadmin
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin

# Allow password authentication for initial key exchange
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart ssh
```

### 3. Key Exchange (Crucial)
```bash
# Run as ansadmin
su - ansadmin
ssh-keygen -t rsa
# Copy key to ALL other nodes (Jenkins, Tomcat, Docker)
ssh-copy-id ansadmin@<Node-IP>
```

### 4. Docker Integration Tools
Ansible needs these to talk to the Docker server:
```bash
ansible-galaxy collection install community.docker
# On the Target Docker Node, you MUST run: sudo apt install python3-docker -y
```
