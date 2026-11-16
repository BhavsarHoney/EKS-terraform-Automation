locals {
  auto_mode_enabled = var.automode

  managed_node_group_enabled = !var.automode

  cluster_tags = merge(
    var.tags,
    {
      Name      = var.cluster_name
      ManagedBy = "Terraform"
    }
  )
}
