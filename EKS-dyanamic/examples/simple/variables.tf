variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "simple-eks"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "owner" {
  type    = string
  default = "platform-team"
}

variable "department" {
  type    = string
  default = "platform"
}

# variable "automode" {
#   description = "Enable EKS Auto Mode."
#   type        = bool
#   default     = true

variable "cluster_version" {
  type    = string
  default = "1.36"
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
