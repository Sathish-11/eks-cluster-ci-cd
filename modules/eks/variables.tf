variable "cluster_name" {
  description  = "Name of the EKS Cluster"
  type         = string
}

variable "cluster_version" {
  description  = "kubernetes version"
  type         = string
}

variable "vpc_id" {
  description  = "VPC ID"
  type         = string
}

variable "subnet_ids" {
  description  = "subnet IDs"
  type         = list(string)
}






































