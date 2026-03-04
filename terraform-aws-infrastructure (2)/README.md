# Terraform AWS Infrastructure

This project provisions AWS infrastructure using Terraform.

## Resources Created

- VPC (10.0.0.0/16)
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- EC2 Instance in Private Subnet
- IAM Role for EC2
- S3 Bucket for application logs

## Project Structure

modules/
  vpc/
  ec2/
  s3/

environments/
  dev/
  prod/

## Prerequisites

- Terraform installed
- AWS CLI configured
- AWS credentials with required permissions

## Deployment

Navigate to environment:

cd environments/dev

Initialize Terraform:

terraform init

Plan:

terraform plan

Apply:

terraform apply

Destroy:

terraform destroy