# # Comprehensive DevOps Project : CI/CD Pipeline Evolution

This report provides a detailed analysis of the multi-stage DevOps project, documenting the transition from simple web server deployments to sophisticated Kubernetes-based orchestration.

## 🛠️ Tool Stack
The project leverages a robust suite of industry-standard DevOps tools:

| Category | Tool | Purpose |
| :--- | :--- | :--- |
| **Source Control** | Git / GitHub | Local and distributed version control for code and manifests. |
| **CI Tool** | Jenkins | Automation server for building, testing, and orchestrating flows. |
| **Build Tool** | Maven | Java project management and artifact generation (`.war`). |
| **CM & Deployment**| Ansible | Configuration management and automated playbooks for Docker/K8s. |
| **Containerization**| Docker | Packaging applications into portable images. |
| **Orchestration** | Kubernetes (EKS)| Management of containerized applications at scale on AWS. |
| **Terminal** | MobaXterm | Enhanced SSH client for Windows-based infrastructure management. |

---

## 🗺️ Workflow Evolution

### Stage 1: Legacy Tomcat Deployment
The baseline pipeline builds a Java web application and deploys it directly to a standalone Tomcat server.

**Flow Mechanism:**
- **Webhook/Poll SCM**: Trigger mechanism.
- **Build**: Jenkins process.
- **WAR Artifact**: Output from Maven.
- **Project Flow:** `GitHub` -> `Jenkins` -> `Maven` -> `Tomcat Server`

### Stage 2: Docker Containerization
Introduction of container-based deployment by packaging the artifact into a Docker image.

- **Project Flow:** `GitHub` -> `Jenkins` -> `Maven Build` -> `Docker Build Image` -> `Docker Run Container`

### Stage 3: Ansible & Docker Automation
Scaling and automating container lifecycle management using Ansible playbooks.

**Automation Components:**
- Playbooks
- Image/Container
- **Project Flow:** `GitHub` -> `Jenkins` -> `Maven Build` -> `Ansible Node` -> `Docker Host` -> `Running Registry`

### Stage 4: Advanced Kubernetes Orchestration
The final stage integrates Ansible to manage deployment triggers on an EKS cluster, leveraging Docker Hub as an intermediate registry.

**Environment Tiers:**
- **Production (AWS EKS)**
- **Automation Hub (Ansible)**
- **CI Server (Jenkins)**
- **Development**

**The Complete Flow:**
`Git Push` -> `GitHub` -> `Jenkins Job` -> `Maven Build` -> `Archive Artifacts` -> `Ansible Playbook` -> `Build Docker Image` -> `Push to Docker Hub` -> `Trigger K8s Apply` -> `EKS Cluster` -> `ReplicaSet / Pods` -> `Load Balancer`

---

## 📂 Project Structure
Managed across Jenkins workspaces, Ansible nodes, and K8s Bootstrap servers.

### 1. Application Core
- `webapp/src/main/webapp/index.jsp`: Main frontend entry point.
- `pom.xml`: Maven configuration for the `hello-world` project.

### 2. Automation & Registry
- `Dockerfile`: Multi-stage build (v1 Centos-based, v2 Tomcat-based).
- `ansible/hosts`: Inventory categorizing `[dockerhost]`, `[ansible]`, and `[kubernetes]`.
- `ansible/kube_deploy.yml`: Playbook for rolling updates on K8s.

### 3. Orchestration Manifests
- `regapp-deploy.yml`: Deployment manifest (3 replicas, RollingUpdate strategy).
- `regapp-service.yml`: Service manifest (Type: LoadBalancer, Port 8080).

---

## 🔑 Essentials & Security Configurations

### 1. Access Control
- **IAM Roles**: The EKS Bootstrap server requires IAM policies for `EC2`, `CloudFormation`, and `EKS` access.
- **Service Users**:
  - `ansadmin`: Dedicated user for Ansible execution across nodes.
  - `dockeradmin`: User with `docker` group permissions for container management.

### 2. Infrastructure Connectivity
- **SSH Key Exchange**: Mandatory SSH trust between Jenkins -> Ansible Server and Ansible Server -> Docker/K8s Nodes.
- **Passwordless Sudo**: Configuring `visudo` for `ansadmin` to prevent pipeline stalls during priviliged commands.

### 3. Jenkins Plugins
> [!IMPORTANT]
> **The following plugins must be installed for full functionality:**
> - GitHub Integration
> - Maven Integration
> - Deploy to Container (for Tomcat stage)
> - Publish Over SSH (for Ansible/Docker stages)

### 4. Kubernetes Strategy
The project uses a **RollingUpdate** strategy (`maxSurge: 1`, `maxUnavailable: 1`) to ensure zero-downtime deployments. Automatic restarts are triggered via `kubectl rollout restart` within Ansible playbooks.
