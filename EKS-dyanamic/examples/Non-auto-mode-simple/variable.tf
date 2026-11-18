variable "region" {
  description = "The AWS region where the EKS cluster will be created."
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "non-auto-mode-simple-eks"
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.36"
}

variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "Owner" {
  description = "The owner of the EKS cluster."
  type        = string
  default     = "platform-team"
}

variable "department" {
  description = "The department responsible for the EKS cluster."
  type        = string
  default     = "platform"
}


