# 🚀 Bingo DevSecOps Project on AWS EKS

An end-to-end DevSecOps project demonstrating CI/CD automation, security scanning, containerization, Kubernetes orchestration, monitoring, and cloud deployment using AWS EKS.

---

# 📌 Project Overview

This project automates the complete software delivery lifecycle for the Bingo application using modern DevSecOps tools and practices.

The pipeline includes:

* Source Code Management with GitHub
* CI/CD automation with Jenkins
* Static Code Analysis using SonarQube
* Dependency Vulnerability Scanning using OWASP Dependency Check
* Filesystem & Container Security Scanning using Trivy
* Docker image build and push
* Kubernetes deployment on AWS EKS
* Monitoring with Prometheus & Grafana
* HTTP Endpoint Monitoring using Blackbox Exporter
* Infrastructure provisioning using Terraform

---

# 🏗️ Project Architecture

```text
GitHub
   ↓
Jenkins Pipeline
   ↓
SonarQube Analysis
   ↓
OWASP Dependency Check
   ↓
Trivy Filesystem Scan
   ↓
Docker Build
   ↓
Trivy Image Scan
   ↓
DockerHub Push
   ↓
AWS EKS Deployment
   ↓
Prometheus Monitoring
   ↓
Grafana Dashboards
```

---

# 🛠️ Tools & Technologies Used

| Category               | Tools                                  |
| ---------------------- | -------------------------------------- |
| Version Control        | GitHub                                 |
| CI/CD                  | Jenkins                                |
| Code Quality           | SonarQube                              |
| Security               | OWASP Dependency Check, Trivy          |
| Containerization       | Docker                                 |
| Orchestration          | Kubernetes, AWS EKS                    |
| Monitoring             | Prometheus, Grafana, Blackbox Exporter |
| Infrastructure as Code | Terraform                              |
| Cloud                  | AWS                                    |

---

# ☁️ AWS Services Used

* Amazon EC2
* Amazon EKS
* Elastic Load Balancer
* IAM
* VPC
* CloudFormation

---

# 📂 Repository Structure

```bash
.
├── Dockerfile
├── Jenkinsfile
├── Kubernetes/
├── Terraform/
├── manifests/
├── monitoring/
├── utils/
└── README.md
```

---

# ⚙️ Jenkins Pipeline Stages

## 1. Clean Workspace

Removes previous build artifacts.

## 2. Git Clone

Fetches latest source code from GitHub.

## 3. SonarQube Analysis

Performs static code analysis and quality checks.

## 4. Quality Gate

Validates code quality against SonarQube Quality Gate.

## 5. Install Dependencies

Installs application dependencies.

## 6. OWASP Dependency Check

Scans project dependencies for known CVEs.

## 7. Trivy Filesystem Scan

Scans source code and filesystem for vulnerabilities.

## 8. Docker Build

Builds Docker image for the application.

## 9. Trivy Image Scan

Scans Docker image for vulnerabilities.

## 10. Docker Push

Pushes Docker image to DockerHub.

## 11. Kubernetes Deployment

Deploys application to AWS EKS cluster.

---

# 🔐 Security Implementation

## SonarQube

* Static code analysis
* Code smells detection
* Bug detection
* Quality Gate validation

## OWASP Dependency Check

* Dependency vulnerability scanning
* CVE detection
* Security reporting

## Trivy

* Filesystem scanning
* Docker image scanning
* Vulnerability detection
* Secret scanning

---

# ☸️ Kubernetes Deployment

The application is deployed on AWS EKS using Kubernetes manifests.

## Common Commands

### Update kubeconfig

```bash
aws eks update-kubeconfig --region ap-south-1 --name bingo-cluster
```

### Check nodes

```bash
kubectl get nodes
```

### Check pods

```bash
kubectl get pods -o wide
```

### Apply manifests

```bash
kubectl apply -f manifest.yml
```

### Get services

```bash
kubectl get svc
```

### Get deployment logs

```bash
kubectl logs -f deployment/bingo-deployment
```

---

# 📊 Monitoring Setup

## Prometheus

Used for:

* Metrics collection
* Target scraping
* Monitoring Kubernetes workloads

## Grafana

Used for:

* Dashboard visualization
* Metrics analysis
* Performance monitoring

## Blackbox Exporter

Used for:

* HTTP endpoint probing
* Uptime monitoring
* SSL monitoring
* Latency measurement

---

# 📈 Monitored Metrics

* probe_success
* probe_http_status_code
* probe_duration_seconds
* SSL certificate expiry
* Application uptime
* HTTP response latency

---

# 🐳 Docker Setup

## Build Docker Image

```bash
docker build -t bingo-app .
```

## Run Container

```bash
docker run -d -p 3000:3000 bingo-app
```

---

# 🧱 Terraform

Terraform is used for infrastructure provisioning.

## Initialize Terraform

```bash
terraform init
```

## Validate Configuration

```bash
terraform validate
```

## Plan Infrastructure

```bash
terraform plan
```

## Apply Infrastructure

```bash
terraform apply
```

---

# 🚀 Application Access

## Application

```text
http://<LOADBALANCER-IP>:3000
```

## Jenkins

```text
http://<JENKINS-IP>:8080
```

## SonarQube

```text
http://<SONARQUBE-IP>:9000
```

## Grafana

```text
http://<GRAFANA-IP>:3000
```

## Prometheus

```text
http://<PROMETHEUS-IP>:9090
```

---

# 📷 Project Screenshots

* Jenkins Pipeline
* SonarQube Dashboard
* Grafana Dashboard
* Prometheus Targets
* AWS EKS Cluster
* Running Application

---

# 🧠 Key Learnings

Through this project, I gained hands-on experience with:

* DevSecOps workflows
* CI/CD automation
* Kubernetes deployments
* Infrastructure provisioning
* Container security
* Monitoring and observability
* AWS cloud services
* Security integration in pipelines

---

# 🔥 Future Improvements

* ArgoCD GitOps integration
* Helm chart deployment
* HTTPS with Ingress Controller
* Alertmanager integration
* Slack/Email notifications
* Horizontal Pod Autoscaling
* Centralized logging using EFK stack

---

# 👨‍💻 Author

Neeraj Yadav

GitHub:
[https://github.com/nrjydv1997](https://github.com/nrjydv1997)

LinkedIn:
[https://linkedin.com/in/neeraj-yadav-9540721a0](https://linkedin.com/in/neeraj-yadav-9540721a0)

---

# ⭐ If You Like This Project

Give this repository a star ⭐ and feel free to fork it.
