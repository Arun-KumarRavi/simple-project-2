# 🗺️ Master Node & Command Map

This guide tells you exactly **where** to run **what**.

| Task | Target Node | Key Command |
| :--- | :--- | :--- |
| **Initial Setup** | All Nodes | `sudo useradd -m ansadmin` |
| **CI Builds** | Jenkins UI | Click "Build Now" |
| **Artifact Check** | Jenkins Server | `ls /var/lib/jenkins/workspace/` |
| **Direct Web Check** | Tomcat Server | `sudo /opt/tomcat/bin/startup.sh` |
| **Key Exchange** | Ansible Server | `ssh-copy-id ansadmin@<Target-IP>` |
| **Python Docker Prep** | Docker Host | `sudo apt install python3-docker -y` |
| **Docker Permission** | Docker Host | `sudo usermod -aG docker ansadmin` |
| **Run Automation** | Ansible Server | `ansible-playbook -i hosts deploy_app.yml` |
| **Check Containers** | Docker Host | `docker ps` |
| **Manage Cluster** | Kubernetes Node (Ansible) | `kubectl get pods` |
| **Build Cluster** | Kubernetes Node (Ansible) | `eksctl create cluster ...` |

### 💡 Pro Tip
- **Always login as `ansadmin`** for everything after the initial setup. 
- **Server 3 (Ansible)** is the "Commander" for both Stage 3 and Stage 4. 
- **Server 4 (Docker)** is the "Worker" for Stage 2 and 3.
- **AWS EKS** creates its own "Workers" automatically in Stage 4.
