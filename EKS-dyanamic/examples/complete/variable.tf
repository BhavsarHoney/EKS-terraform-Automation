variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "complete-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.35"
}

variable "auto_mode_node_pools" {
  description = "The node pools to enable when EKS Auto Mode is active."
  type        = list(string)
  default     = ["general-purpose", "system"]
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  type        = bool
  default     = true
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

variable "environment" {
  description = "Deployment environment"
  type        = string
}
variable "Owner" {
  description = "The owner of the EKS cluster."
  type        = string
  default     = "platform-team"
}

variable "Department" {
  description = "The department responsible for the EKS cluster."
  type        = string
  default     = "platform"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "automode" {
  description = "Enable EKS Auto Mode."
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDRs allowed to access EKS public endpoint."
  type        = list(string)
}
