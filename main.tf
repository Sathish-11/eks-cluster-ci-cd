# main.tf file (root level)
# Backend configuration
terraform {
  backend "s3" {
    bucket         = "sat-s3-eks-backend"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "backend-db"
    encrypt        = true
  }
}

# 1. First , declare what provider can be used
provider "aws" {
  region = var.region
}

# 2. "We need VPC" -> Create a module call
module "vpc" {
  source = "./modules/VPC"

  #what does VPC need? 
  cluster_name = var.cluster_name
  vpc_cidr     = var.vpc_cidr

  # subnets in different zones (AWS requirement)
  availability_zones = var.availability_zones          
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

# EKS module
module "eks" {
  source = "./modules/eks"
  
  cluster_name         = var.cluster_name
  cluster_version      = var.cluster_version
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.vpc.private_subnet_ids
  node_groups          = var.node_groups
}

