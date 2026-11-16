output "cluster_name" {
  description = "EKS cluster name."
  value       = aws_eks_cluster.this.name
}

output "cluster_arn" {
  description = "EKS cluster ARN."
  value       = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  description = "EKS cluster API endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_version" {
  description = "EKS Kubernetes version."
  value       = aws_eks_cluster.this.version
}

output "cluster_security_group_id" {
  description = "EKS cluster security group ID."
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "automode_enabled" {
  description = "Whether EKS Auto Mode is enabled."
  value       = var.automode
}

output "node_group_name" {
  description = "Managed node group name. Null when Auto Mode is enabled."

  value = var.automode ? null : aws_eks_node_group.this[0].node_group_name
}

output "cluster_role_arn" {
  description = "EKS cluster IAM role ARN."
  value       = aws_iam_role.cluster.arn
}

output "auto_mode_node_role_arn" {
  description = "Auto Mode node IAM role ARN. Null when Auto Mode is disabled."

  value = var.automode ? aws_iam_role.auto_mode_node[0].arn : null
}

output "managed_node_role_arn" {
  description = "Managed node group IAM role ARN. Null when Auto Mode is enabled."

  value = var.automode ? null : aws_iam_role.managed_node[0].arn
}
