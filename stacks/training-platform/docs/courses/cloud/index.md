# Cloud Platform Engineering Lab

A production-style cloud engineering project demonstrating Infrastructure as Code, automation, container platforms, monitoring, security and DevOps practices using:

* AWS
* Terraform
* Ansible
* Docker
* Nginx
* Prometheus
* Grafana

The project demonstrates a complete cloud platform lifecycle from infrastructure provisioning through to application deployment, monitoring and secure external access.

---

# Project Goals

This project was created to demonstrate practical cloud engineering skills:

* Infrastructure as Code
* Automated server configuration
* Container deployment
* Secure cloud networking
* Monitoring and observability
* Repeatable deployments
* Platform engineering practices

The long-term objective is to build a foundation for Kubernetes, GitOps and CI/CD workflows.

---

# Architecture Overview

```text
Developer Workstation

        |
        v

GitHub Repository

        |
        v

Terraform
Infrastructure as Code

        |
        v

AWS Cloud Platform

        |
        v

Ansible Configuration

        |
        v

Docker Platform

        |
        +----------------+
        |                |
        v                v

     Nginx          Monitoring Stack
 Reverse Proxy             |
        |                  |
        |        +---------+---------+
        |        |         |         |
        v        v         v         v

 HTTPS/TLS   Grafana Prometheus Node Exporter
             Dashboards Metrics   Host Metrics

                         cAdvisor
                    Container Metrics
```

# Documentation

The following documentation covers the design, deployment approach, repository structure and ongoing development of the cloud engineering project.

* [Architecture](content/docs/Architecture.md)
* [Deployment](content/docs/Deployment.md)
* [Repository Structure](content/docs/Repository-Structure.md)
* [Decisions](content/docs/Decisions.md)
* [Project Roadmap](content/docs/ProjectRoadmap.md)
* [Progress](content/docs/Progress.md)
---

# Technology Stack

## Cloud Infrastructure

| Technology      | Purpose                 |
| --------------- | ----------------------- |
| AWS VPC         | Network foundation      |
| EC2             | Cloud compute           |
| S3              | Terraform remote state  |
| DynamoDB        | Terraform state locking |
| IAM             | Access control          |
| Security Groups | Network security        |

---

## Infrastructure Automation

| Technology     | Purpose                     |
| -------------- | --------------------------- |
| Terraform      | Infrastructure provisioning |
| Ansible        | Server configuration        |
| Docker Compose | Application deployment      |

---

## Platform Services

| Service       | Purpose                             |
| ------------- | ----------------------------------- |
| Nginx         | Reverse proxy and HTTPS termination |
| Grafana       | Monitoring dashboards               |
| Prometheus    | Metrics collection                  |
| Node Exporter | Host monitoring                     |
| cAdvisor      | Container monitoring                |

---

# Current Deployment Status

| Component               | Status     |
| ----------------------- | ---------- |
| AWS foundation          | ✅ Complete |
| Terraform modules       | ✅ Complete |
| Remote state management | ✅ Complete |
| VPC networking          | ✅ Complete |
| EC2 deployment          | ✅ Complete |
| Security Groups         | ✅ Complete |
| Ansible automation      | ✅ Complete |
| Docker platform         | ✅ Complete |
| Monitoring stack        | ✅ Complete |
| Nginx reverse proxy     | ✅ Complete |
| HTTPS certificates      | ✅ Complete |
| Authentication layer    | ⬜ Planned  |
| Central logging         | ⬜ Planned  |
| CI/CD pipeline          | ⬜ Planned  |
| Kubernetes platform     | ⬜ Planned  |

---

# Live Platform

Current services hosted on AWS:

| Service       | Purpose             |
| ------------- | ------------------- |
| Nginx         | HTTPS reverse proxy |
| Grafana       | Dashboards          |
| Prometheus    | Metrics database    |
| Node Exporter | Host metrics        |
| cAdvisor      | Container metrics   |

External endpoints:

* https://grafana.jrwroberts.co.uk
* https://prometheus.jrwroberts.co.uk

---

# Deployment Workflow

The platform follows a repeatable deployment process:

```text
Developer Machine

        |
        v

Git Commit

        |
        v

Terraform

Creates AWS Infrastructure

        |
        v

Ansible

Configures EC2 Server

        |
        v

Docker Compose

Deploys Services

        |
        v

Nginx + Let's Encrypt

Provides Secure Access

        |
        v

Monitoring Platform

Provides Observability
```

---

# Repository Structure

```
cloud-platform/

├── ansible/
│   ├── inventory/
│   ├── playbooks/
│   └── roles/
│
├── docker/
│   └── compose/
│
├── docs/
│   ├── Architecture.md
│   ├── Decisions.md
│   ├── Deployment.md
│   └── Roadmap.md
│
├── terraform/
│   ├── bootstrap/
│   ├── environments/
│   └── modules/
│
├── scripts/
│
└── README.md
```

More detail:

* [Repository Structure](content/docs/Repository-Structure.md)

---

# Roadmap

## Completed

### Cloud Foundation

* Terraform infrastructure
* AWS networking
* EC2 deployment
* Security configuration

### Platform Layer

* Docker deployment
* Monitoring stack
* Reverse proxy

### Secure Access

* DNS integration
* HTTPS certificates
* Automated renewal

---

## Planned

### Operations Platform

* Central logging
* Alerting
* Backup automation
* Disaster recovery testing

### Advanced Platform Engineering

* Kubernetes (k3s)
* GitHub Actions CI/CD
* GitOps workflows
* Multi-environment deployments

---

# Skills Demonstrated

* AWS Cloud Infrastructure
* Terraform Infrastructure as Code
* Ansible Automation
* Linux Administration
* Docker Platforms
* Nginx Reverse Proxy
* HTTPS/TLS
* Monitoring and Observability
* Networking
* Security Engineering
* Git Workflows
* Platform Engineering

---

# Author

James Roberts

Cloud Platform Engineering Lab
