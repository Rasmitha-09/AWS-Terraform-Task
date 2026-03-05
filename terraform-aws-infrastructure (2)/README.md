# Terraform AWS Infrastructure

## Overview

This project provisions basic AWS infrastructure using **Terraform**.
The infrastructure is organized using **Terraform modules** and supports **two environments: dev and prod**.

The following resources are created:

* VPC (10.0.0.0/16)
* 2 Public Subnets
* 2 Private Subnets
* Internet Gateway
* EC2 Instance in a private subnet
* IAM Role attached to the EC2 instance
* S3 bucket for storing application logs

---

# Project Structure

terraform-aws-infrastructure/

modules/
    vpc/ → Creates VPC, subnets, and Internet Gateway
    ec2/ → Creates EC2 instance with IAM role
    s3/ → Creates S3 bucket for logs

environments/
    dev/ → Development environment configuration
    prod/ → Production environment configuration

README.md

---

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

Three Terraform modules are used to organize the infrastructure.

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

The EC2 instance is deployed inside a **private subnet**.

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
