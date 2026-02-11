# 🌊 DevOps Project: Waterfall Model Implementation Guide

This guide breaks down our CI/CD pipeline project using the structured **Waterfall Model**, providing a clear path from initial requirements to final production deployment.

---

## 📋 Phase 1: Requirements Gathering
**Objective:** Define the scope and necessary tools for the DevOps pipeline.
- **Requirement:** A multi-stage pipeline moving from legacy to cloud-native.
- **Tools Identified:** Git, Jenkins, Maven, Ansible, Docker, Kubernetes (AWS EKS).
- **Environment:** Ubuntu-based EC2 instances for modular isolation.

---

## 🔍 Phase 2: System Analysis
**Objective:** Architect the flow and node relationships.
- **Architecture:** 4-Server setup (Jenkins, Tomcat, Ansible, Docker Host).
- **Tool Logic:** 
  - *Jenkins* for CI.
  - *Maven* for artifact generation.
  - *Ansible* for CM automation.
  - *Docker* for containerization.
  - *EKS* for high-availability orchestration.

---

## 🎨 Phase 3: Design & Logic
**Objective:** Design the visual workflows and security protocols.
- **Workflows:** 4-Stage evolution (Tomcat -> Docker -> Ansible -> K8s).
- **Security Design:** SSH key exchange between nodes, IAM roles for EKS, and `visudo` for automated execution.
- **Diagram Design:** Professional box-and-arrow architecture diagrams.

---

## 🏗️ Phase 4: Implementation (The Pipeline)
**Objective:** Hands-on setup of the infrastructure.
### **Steps:**
1. **Node Provisioning:** Deploy 4 Ubuntu instances.
2. **Tool Installation:** (Refer to `nodes/` folder for specific scripts).
   - Install Jenkins & Java on Server 1.
   - Install Tomcat & Java on Server 2.
   - Install Ansible on Server 3 (Control Node).
   - Install Docker on Server 4 (Target Node).
3. **Connectivity:** Configure `ansadmin` user and SSH trust across all instances.

---

## 🧪 Phase 5: Testing & Verification
**Objective:** Validate that each stage functions correctly.
- **Stage 1 Test:** Build a `.war` file and deploy to Tomcat.
- **Stage 2 Test:** Create a `Dockerfile` and run as a container locally.
- **Stage 3 Test:** Run an Ansible Playbook to deploy container to a remote node.
- **Stage 4 Test:** Apply Kubernetes YAMLs to EKS and check Load Balancer connectivity.

---

## 🚀 Phase 6: Deployment & Maintenance
**Objective:** Final handover and operational persistence.
- **Deployment:** Continuous Integration triggers via GitHub Webhooks.
- **Maintenance:** Monitoring K8s pods and updating Ansible playbooks for future application versions.
- **Strategy:** RollingUpdate for zero-downtime consistency.

---

> [!IMPORTANT]
> **Conclusion**: The Waterfall Model ensures that each layer (Requirements -> Analysis -> Design -> Implementation) is solidified before moving strictly to the next, resulting in a robust and documented enterprise-grade pipeline.

---
*End-to-End DevOps Lifecycle Management.*
