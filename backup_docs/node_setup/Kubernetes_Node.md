# ☸️ Kubernetes Management Node Setup (Gold Standard)

The command center for your AWS EKS cluster. Choose either Jenkins or Ansible node for this.

### 1. AWS CLI (The Remote Control)
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

### 2. kubectl (The Command Center)
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

### 3. eksctl (The Cluster Builder)
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
```

### 4. AWS Identity Configuration
Required to build the cluster on AWS.
```bash
aws configure
# Access Key ID: <Your-Key>
# Secret Access Key: <Your-Secret>
# Default region: us-east-1
# Default format: json
```
