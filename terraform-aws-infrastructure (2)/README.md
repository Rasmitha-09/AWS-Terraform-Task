# Terraform AWS Infrastructure

## Overview

This project contains Terraform code to provision a basic AWS infrastructure setup.
The infrastructure is organized using **Terraform modules** and supports **two environments: dev and prod**.

The infrastructure includes:

* VPC (10.0.0.0/16)
* 2 Public Subnets
* 2 Private Subnets
* Internet Gateway
* EC2 Instance in a private subnet
* IAM Role attached to the EC2 instance
* S3 bucket for storing application logs

---

# Project Structure

The repo is organized into a terraform-aws-infrastructure/ folder. 

Inside, there's a modules/ directory with three subfolders: 
vpc/ handles the VPC, subnets, and Internet Gateway setup; e
c2/ takes care of spinning up the EC2 instance along with its IAM role; and 
s3/ sets up the S3 bucket used for storing logs.
For environment configs, there's an environments/ folder with separate dev/ and prod/ directories. 
A README.md lives at the root.

# Environments

The project supports **two environments**:

### dev

Used for development and testing.

### prod

Used for production deployment.

Each environment contains:

* `main.tf`
* `variables.tf`
* `terraform.tfvars`

These files define the infrastructure and environment-specific values.

---

# Modules

The infrastructure is divided into three Terraform modules.

### VPC Module

Creates:

* VPC
* Public subnets
* Private subnets
* Internet Gateway

### EC2 Module

Creates:

* EC2 instance
* IAM role
* IAM instance profile
* User data configuration

The EC2 instance is deployed inside a **private subnet**. because the instance does not need direct public access.

### S3 Module

Creates:

* S3 bucket used to store application logs.

---

# Prerequisites

Make sure the following tools are installed:

* Terraform
* AWS CLI
* AWS account with necessary permissions

Configure AWS credentials:

aws configure

---

# How to Deploy

Go to the environment folder.

Example for **dev**:

cd environments/dev

Initialize Terraform:

terraform init

Check the execution plan:

terraform plan

Apply the infrastructure:

terraform apply

---

# Variables

Environment-specific values are defined in **terraform.tfvars**.

Example:

region = "us-east-1"
ami = "ami-xxxxxxxx"
instance_type = "t2.micro"

---

# Assumptions

* Infrastructure is deployed in a single AWS region.
* EC2 instance runs in a private subnet.
* S3 bucket is used to store application logs.
* IAM roles are used instead of storing credentials.

---

# Notes

* Secrets or account IDs are not hardcoded.
* Terraform modules are used for better code organization and reuse.
* Separate environments allow independent deployments for dev and prod.

---
