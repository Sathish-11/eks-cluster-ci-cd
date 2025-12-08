variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description  = "Name of the eks cluster"
  type         = string
}

variable "cluster_version" {
  description  = "kubernetes version"
  type         = string
}

variable "vpc_id" {
  description  = "VPC_ID"
  type         = string
  default      = "10.0.0.0/16"
}

variable "subnet_ids" {
  description  = "Subnet IDs"
  type         = list(string)
}

variable "node_groups" {
  description  = "EKS node group configuration" 
  type         = map(object({
    instance_types = list(string)



