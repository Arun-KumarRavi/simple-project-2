# ☸️ Node 5: Kubernetes Orchestration (AWS EKS)

This stage transitions our application from a single Docker Host to a **Kubernetes Cluster**, where it can scale, heal itself, and handle massive traffic.

---

### 1. Prerequisites (The Management Node)
You can use either your **Jenkins Server** or **Ansible Server** as the controller. Run these setup commands there:

#### **A. Install AWS CLI**
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

#### **B. Install kubectl**
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
```

#### **C. Install eksctl**
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```

---

### 2. AWS Configuration
You need an IAM User with `AdministratorAccess` to create the cluster.

```bash
aws configure
# Enter Access Key ID
# Enter Secret Access Key
# Region: us-east-1 (or your preferred region)
# Format: json
```

---

### 3. Create the EKS Cluster
This command creates a "Production-Ready" cluster. **Note: This takes 15-20 minutes.**

```bash
eksctl create cluster --name devops-project --region us-east-1 --nodegroup-name standard-nodes --node-type t3.medium --nodes 2 --nodes-min 1 --nodes-max 3 --managed
```

---

### 4. Deploy the Application
Once the cluster is ready, apply the manifest:

```bash
kubectl apply -f simple-project-2/code/k8s_deploy.yml
```

#### **Check the progress:**
```bash
# See pods running
kubectl get pods

# Get the LoadBalancer URL
kubectl get svc
```

---

### 🏁 **The Final Verification**
Copy the `EXTERNAL-IP` from `kubectl get svc`.
Visit: `http://<LoadBalancer-URL>:8080/hello-world/`

**You are now officially a Kubernetes Master!** ☸️🔥
