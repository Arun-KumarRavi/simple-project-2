# 🤖 Node 3: Ansible Control Node Setup (Official Guide)

The decentralized "Brain" that manages all other servers in your DevOps environment.

________________________________________
### Ansible Installation on Ubuntu EC2

#### Step 1: Install Ansible Core
```bash
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
```
________________________________________
#### Step 2: Create Admin User (`ansadmin`)
This user is mandatory for all automation stages.
```bash
sudo useradd -m -s /bin/bash ansadmin
echo "ansadmin:password" | sudo chpasswd
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansadmin
```
________________________________________
#### Step 3: Enable Password Authentication
*Temporary required for copying SSH keys easily.*
```bash
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart ssh
```
________________________________________
#### Step 4: Generate and Exchange SSH Keys (Crucial)
Run these as the `ansadmin` user to establish trust with other nodes.
```bash
su - ansadmin
ssh-keygen -t rsa   # Press Enter for all prompts
ssh-copy-id ansadmin@<Jenkins-IP>
ssh-copy-id ansadmin@<Tomcat-IP>
ssh-copy-id ansadmin@<Docker-IP>
```
________________________________________
#### Step 5: Install Docker Integration Tools
Ansible needs these to control the Docker Host remotely.
```bash
ansible-galaxy collection install community.docker
```

---

### Step 6: Verify Connection
Test if Ansible can "ping" the other servers:
```bash
# Example for one server
ansible all -i "<Target-IP>," -m ping -u ansadmin
```
