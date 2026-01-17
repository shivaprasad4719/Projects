# 🚀 Project: End-to-End AWS Infrastructure Automation & Application Deployment
# 📌 Project Overview
- This project demonstrates end-to-end infrastructure automation and application deployment on AWS using Terraform for Infrastructure as Code, Ansible for configuration management and application deployment, Bash scripting for automation tasks, and Amazon CloudWatch for monitoring and centralized logging.
<pre>
* The goal is to eliminate manual infrastructure provisioning and deployments while ensuring visibility and reliability through monitoring.
</pre>
# 🛠️ Tech Stack
- AWS: EC2, VPC, IAM, CloudWatch
- Terraform: Infrastructure provisioning
- Ansible: Configuration management & app deployment
- Bash: Automation scripts
- Linux (Amazon Linux 2)
- Nginx / Sample Web Application
---
# 🔧 Project Workflow
<pre>
🏗️ Architecture Overview
Developer
   |
   |  terraform apply
   v
AWS Infrastructure
(VPC, EC2, Security Groups, IAM)
   |
   |  Ansible Playbooks
   v
Application Deployment
(Nginx / Web App)
   |
   |  Bash Scripts
   v
Service Automation
   |
   |  Logs & Metrics
   v
Amazon CloudWatch
</pre>
