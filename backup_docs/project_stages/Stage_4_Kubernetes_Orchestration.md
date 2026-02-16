# ☸️ Stage 4: Kubernetes Orchestration (AWS EKS)

The final mission: Deploying highly-available containers to the cloud.

### 1. Cluster Creation (15-20 Minutes)
```bash
eksctl create cluster --name devops-project --region us-east-1 --nodegroup-name standard-nodes --node-type t3.medium --nodes 2 --nodes-min 1 --nodes-max 3 --managed
```

### 2. Deployment Manifest (k8s_deploy.yml)
Defines 3 pods (replicas) and a LoadBalancer.
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: regapp-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: regapp
  template:
    metadata:
      labels:
        app: regapp
    spec:
      containers:
      - name: regapp
        image: your-id/hello-world:latest
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: regapp-service
spec:
  type: LoadBalancer
  selector:
    app: regapp
  ports:
  - port: 80
    targetPort: 8080
```

### 3. Application Execution
```bash
kubectl apply -f k8s_deploy.yml

# Find the URL
kubectl get svc regapp-service
```

### 4. Verification
Copy the `EXTERNAL-IP` (an AWS ELB address).
Visit: `http://<LoadBalancer-DNS>/hello-world/`
