
# CI CD Using EKS

This project includes building complete infrastructure and deploy Nodejs Application of AWS EKS Cluster.

# Tools Used:
1- Terraform infrastructure as a code to build the infrastructure, Terraform code includes:
```bash
(VPC - 2 public subnets - 2 private subnets - EKS cluster with workernode and roles - internet gateway - nat gateway - route tables - Bastion Host).
```
Bastion Host is used to allow ansible to configure the private workernode in the EKS Cluster.
---
2- Ansible:
```bash
Used Ansible playbook, roles & tasks to install Docker daemon in the workernode
```
Note: to be able to use ansible with a private workernode you have to touch a config file in this path ~/.ssh/config the config file is as follow:
```bash
Host bastion
    hostname "public ip of the bastion"
    user ubuntu
    port 22
    identityfile /path/to/the/key
```
---
3- AWS EKS:
```bash
Used to deploy my Nodejs Application
```
---
4- Docker:
```bash
Used to build dockerfiles for jenkins and the application
```
---
5- Jenkins:
```bash
Used to make the CI CD part and make a complete pipeline
```

# Note: Don't forget to use a customized image for jenkins that includes docker and kubectl utilities!
