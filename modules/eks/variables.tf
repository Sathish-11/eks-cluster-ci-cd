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

variable "node_groups" {
  description  = "EKS node group configuration"
  type       = map(object({
    instance_type    = list(string)
    capacity_type    = string
    scaling_capacity = object({
      desired_size   = number
      max_size       = number
      min_size       = number
    })
  }))
}





































