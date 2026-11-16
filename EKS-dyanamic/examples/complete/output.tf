output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_arn" {
  value = module.eks.cluster_arn
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_version" {
  value = module.eks.cluster_version
}

output "automode_enabled" {
  value = module.eks.automode_enabled
}

output "node_group_name" {
  value = module.eks.node_group_name
}

output "cluster_role_arn" {
  value = module.eks.cluster_role_arn
}

output "auto_mode_node_role_arn" {
  value = module.eks.auto_mode_node_role_arn
}

output "managed_node_role_arn" {
  value = module.eks.managed_node_role_arn
}
