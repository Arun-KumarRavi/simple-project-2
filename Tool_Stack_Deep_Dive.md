# 🧠 Tool Stack Deep Dive: Why & How We Use Them

This document explores the core technologies powering our DevOps pipeline, focusing on the strategic rationale and visual logic behind each choice.

---

## 🛠️ Jenkins: The Orchestrator
**Why use it?** Jenkins is the "brain" of our operation. It removes human error by automating the entire process from code commit to deployment.

**Diagram Art:**
```mermaid
graph TD
    classDef main fill:#e6e6ff,stroke:#7d7db3;
    A[Code Push] --> B(Jenkins):::main
    B -->|Triggers| C[Maven Build]
    B -->|Orchestrates| D[Ansible Deploy]
    B -->|Notifies| E[Success/Failure]
```

---

## 🏗️ Maven: The Builder
**Why use it?** Java projects are complex projects with many dependencies. Maven standardizes the project structure and automates the creation of the `.war` artifact.

**Diagram Art:**
```mermaid
graph LR
    classDef main fill:#e6e6ff,stroke:#7d7db3;
    A[Source Code] --> B(Maven):::main
    B -->|Fetches| C[Dependencies]
    C --> B
    B -->|Output| D[WAR File]
```

---

## 🐯 Tomcat: The Home for Code
**Why use it?** Our Java code needs a server that understands `.war` files. Tomcat provides the runtime environment to host our web application.

**Diagram Art:**
```mermaid
graph LR
    classDef main fill:#e6e6ff,stroke:#7d7db3;
    User[Web Browser] -->|Port 8080| A(Tomcat Server):::main
    A -->|Hosts| B[Java Web App]
```

---

## 🐳 Docker: The Environment Box
**Why use it?** Docker solves the "it works on my machine" problem. It packages the code and the entire operating system environment into a single, portable image.

**Diagram Art:**
```mermaid
graph TD
    classDef main fill:#e6e6ff,stroke:#7d7db3;
    subgraph Containerization
        style Containerization fill:#f0f7ff,stroke:#d0e0f0
        A[Java App] --- B[Tomcat OS]
        B --- C[Libraries]
    end
    Containerization --> D(Docker Image):::main
```

---

## 🤖 Ansible: The Automation Hand
**Why use it?** Instead of logging into 100 servers to run commands, we use Ansible. It uses "Playbooks" to ensure all servers are configured exactly the same way.

**Diagram Art:**
```mermaid
graph LR
    classDef main fill:#e6e6ff,stroke:#7d7db3;
    A(Ansible Control Node):::main -->|SSH| B[Server 1]
    A -->|SSH| C[Server 2]
    A -->|SSH| D[Server 3]
```

---

## ☸️ Kubernetes (EKS): The Manager
**Why use it?** Docker run containers, but Kubernetes manages them. If a container dies, K8s restarts it. If traffic grows, K8s scales it. It's the ultimate production-grade manager.

**Diagram Art:**
```mermaid
graph TD
    classDef main fill:#e6e6ff,stroke:#7d7db3;
    subgraph "K8s Cluster"
        style "K8s Cluster" fill:#f8fff8,stroke:#e0eee0
        A(Master Node):::main -->|Monitors| B[Worker Pods]
        B --> C[Service Load Balancer]
    end
```

---

> [!TIP]
> **Conclusion**: Each tool represents a layer of reliability. **Jenkins** starts the engine, **Maven** builds the parts, **Docker** boxes them up, **Ansible** delivers them, and **Kubernetes** keeps the lights on.

---
*Professional DevOps Architecture Documentation.*
