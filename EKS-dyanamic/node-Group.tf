resource "aws_eks_node_group" "this" {
  count = var.automode ? 0 : 1

  cluster_name = aws_eks_cluster.this.name

  node_group_name = var.node_group_name

  node_role_arn = aws_iam_role.managed_node[0].arn

  subnet_ids = var.private_subnet_ids


  # -------------------------------------------------------
  # Compute
  # -------------------------------------------------------

  instance_types = var.node_instance_types

  capacity_type = var.node_capacity_type

  ami_type = var.node_ami_type

  # -------------------------------------------------------
  # Scaling
  # -------------------------------------------------------

  scaling_config {
    desired_size = var.node_desired_size

    min_size = var.node_min_size

    max_size = var.node_max_size
  }


  # -------------------------------------------------------
  # Update
  # -------------------------------------------------------

  update_config {
    max_unavailable = 1
  }


  # -------------------------------------------------------
  # Disk
  # -------------------------------------------------------

  disk_size = var.node_disk_size


  # -------------------------------------------------------
  # Labels
  # -------------------------------------------------------

  labels = {
    ManagedBy = "Terraform"
  }


  # -------------------------------------------------------
  # Tags
  # -------------------------------------------------------

  tags = merge(
    local.cluster_tags,
    {
      Name = "${var.cluster_name}-${var.node_group_name}"
    }
  )


  depends_on = [
    aws_iam_role_policy_attachment.managed_node_worker,

    aws_iam_role_policy_attachment.managed_node_cni,

    aws_iam_role_policy_attachment.managed_node_ecr
  ]
}
