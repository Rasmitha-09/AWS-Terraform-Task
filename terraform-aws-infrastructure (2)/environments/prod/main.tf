provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24","10.0.12.0/24"]
  azs             = ["us-east-1a","us-east-1b"]
  env             = "prod"
}

module "ec2" {
  source = "../../modules/ec2"

  ami            = var.ami
  instance_type  = var.instance_type
  private_subnet = module.vpc.private_subnets[0]
  env            = "prod"
}

module "s3" {
  source = "../../modules/s3"
  env    = "prod"
}