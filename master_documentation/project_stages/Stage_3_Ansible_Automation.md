# 🤖 Stage 3: Ansible Automation

Automatically manage the lifecycle of your containers from a central node.

### 1. The Global Inventory
Edit `/etc/ansible/hosts`:
```ini
[dockerhost]
<Your-Docker-Server-IP>
```

### 2. The Playbook (Correction: force_source)
Ensures the server always pulls the newest code from the cloud.
```yaml
---
- name: Deploy Java App in Docker
  hosts: dockerhost
  become: true
  tasks:
    - name: Stop existing container
      docker_container:
        name: my-app
        state: absent
      ignore_errors: yes

    - name: Pull latest image
      docker_image:
        name: "your-id/hello-world:latest"
        source: pull
        force_source: yes  # Forces fresh pull

    - name: Run new container
      docker_container:
        name: my-app
        image: "your-id/hello-world:latest"
        state: started
        published_ports:
          - "8080:8080"
```

### 3. Execution
```bash
ansible-playbook -i /etc/ansible/hosts deploy_app.yml
```

### 4. Verification
Check browser status page. Refresh should show Stage 3 as COMPLETED.
