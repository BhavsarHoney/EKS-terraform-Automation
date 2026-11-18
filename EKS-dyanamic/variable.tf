variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version of the EKS cluster."
  type        = string
  default     = "1.36"
}


variable "automode" {
  description = "Enable EKS Auto Mode. If false, a managed node group is created."
  type        = bool
  default     = false
}

variable "auto_mode_node_pools" {
  description = "The node pools to enable when EKS Auto Mode is active."
  type        = list(string)
  default     = ["general-purpose", "system"]
}

variable "authentication_mode" {
  description = "The authentication mode for the cluster. Valid values: API, CONFIG_MAP, API_AND_CONFIG_MAP."
  type        = string
  default     = "API_AND_CONFIG_MAP"

  validation {
    condition     = contains(["API", "CONFIG_MAP", "API_AND_CONFIG_MAP"], var.authentication_mode)
    error_message = "Authentication mode must be one of: API, CONFIG_MAP, API_AND_CONFIG_MAP."
  }
}

variable "admin_access_entry_principals" {
  description = "List of IAM principals (users or roles) that should have admin access to the EKS cluster."
  type        = list(string)
  default     = []
}
variable "vpc_id" {
  description = "VPC ID for the EKS cluster."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs used by the EKS control plane."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs used by the managed node group."
  type        = list(string)
}


variable "endpoint_private_access" {
  description = "Whether the EKS API endpoint is privately accessible."
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether the EKS API endpoint is publicly accessible."
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDRs allowed to access the public EKS API endpoint."
  type        = list(string)

  default = [
    "0.0.0.0/0"
  ]
}

variable "node_group_name" {
  description = "Name of the managed node group."
  type        = string
  default     = "default"
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group."
  type        = list(string)

  default = [
    "m6i.large"
  ]
}

variable "node_ami_type" {
  description = "AMI type for the managed node group."
  type        = string
  default     = "AL2023_x86_64_STANDARD"

}
variable "node_capacity_type" {
  description = "Capacity type for the managed node group."
  type        = string
  default     = "ON_DEMAND"

  validation {
    condition = contains(
      ["ON_DEMAND", "SPOT"],
      var.node_capacity_type
    )

    error_message = "node_capacity_type must be ON_DEMAND or SPOT."
  }
}

variable "node_desired_size" {
  description = "Desired number of nodes."
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of nodes."
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of nodes."
  type        = number
  default     = 5
}

variable "node_disk_size" {
  description = "Root disk size of managed nodes in GiB."
  type        = number
  default     = 50
}


variable "tags" {
  description = "Tags applied to EKS resources."
  type        = map(string)
  default     = {}
}


# ---------------------------------------------------------
# Pod Identity
# ---------------------------------------------------------

variable "pod_identity_associations" {
  description = "EKS Pod Identity associations."

  type = map(object({
    namespace       = string
    service_account = string
    role_arn        = string
  }))

  default = {}
}
