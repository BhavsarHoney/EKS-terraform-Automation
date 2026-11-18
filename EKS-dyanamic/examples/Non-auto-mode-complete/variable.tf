variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "non-auto-mode-eks"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.36"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "Owner" {
  description = "The owner of the EKS cluster."
  type        = string
  default     = "platform-team"
}

variable "department" {
  description = "The department responsible for the EKS cluster."
  type        = string
  default     = "PES-IA"
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}


variable "cluster_endpoint_private_access" {
  description = "Whether the EKS API endpoint is privately accessible"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS API endpoint is publicly accessible"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "List of CIDR blocks allowed to access the EKS API endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "authentication_mode" {
  description = "Authentication mode for the EKS cluster"
  type        = string
  default     = "aws-iam-authenticator"
}

variable "admin_access_entry_principals" {
  description = "List of IAM principals (users or roles) with admin access to the EKS cluster"
  type        = list(string)
  default     = []
}


### node group configuration

variable "node_group_name" {
  description = "Name of the managed node group"
  type        = string
  default     = "non-auto-mode-node-group"
}

variable "node_instance_type" {
  description = "Instance type for the managed node group"
  type        = list(string)
  default     = ["m6i.large"]
}

variable "node_capacity_type" {
  description = "Capacity type for the managed node group (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}


variable "node_max_size" {
  description = "Maximum size for the managed node group"
  type        = number
  default     = 3
}

variable "node_min_size" {
  description = "Minimum size for the managed node group"
  type        = number
  default     = 1
}

variable "node_disk_size" {
  description = "Disk size (in GiB) for the managed node group"
  type        = number
  default     = 20
}

variable "node_desired_size" {
  description = "Desired size for the managed node group"
  type        = number
  default     = 2
}
