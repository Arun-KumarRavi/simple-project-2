# 📝 DevOps Lessons Learned & Fixes Summary

This document summarizes the major hurdles we encountered and the final "Gold Standard" solutions applied.

### 1. The "Secret Bug" (Docker Runtime)
- **Problem**: Application crashed with `java.lang.NullPointerException` in `CgroupV2Subsystem`.
- **Cause**: Older OpenJDK 11 images (like `openjdk-11-slim`) are NOT fully compatible with newer Linux kernels using cgroups v2.
- **Fix**: Switched the base image to `tomcat:9.0-jdk11-temurin`. Temurin images have better cgroup v2 support.

### 2. The Python Security Shield (Ansible)
- **Problem**: `pip install docker` failed with `error: externally-managed-environment`.
- **Cause**: Modern Ubuntu (24.04+) follows PEP 668, which prevents `pip` from modifying the system Python environment.
- **Fix**: Use the official Ubuntu package: `sudo apt install python3-docker -y`.

### 3. Permission Denied (Docker-Ansible)
- **Problem**: Ansible could connect but couldn't run Docker commands.
- **Cause**: The `ansadmin` user was not part of the `docker` group on the target host.
- **Fix**: Added `sudo usermod -aG docker ansadmin` to the Docker node setup.

### 4. Port Conflict (Ansible)
- **Problem**: Ansible failed to start the container because "port 8080 is already allocated."
- **Cause**: Manual testing used one container name (`my-app`), while automation used another (`my-webapp`). Ansible didn't know to stop the manual one.
- **Fix**: Unified the container name to `my-app` across all playbooks and code.

### 5. Cached Status Page
- **Problem**: Status page showed "PENDING" even after Stage 3 was done.
- **Cause**: Docker/Ansible was pulling a cached image, or the user hadn't run the full Jenkins build loop to refresh the `index.jsp`.
- **Fix**: Added `force_source: yes` to the Ansible playbook and enforced a full "Jenkins Build -> Ansible Playout" sequence.
