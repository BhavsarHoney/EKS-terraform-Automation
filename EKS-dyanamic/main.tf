resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = aws_iam_role.cluster.arn


  # -------------------------------------------------------
  # Bootstrap Add-ons
  #
  # Auto Mode = false
  #   → EKS installs normal default add-ons
  #
  # Auto Mode = true
  #   → Auto Mode manages the infrastructure
  # -------------------------------------------------------

  bootstrap_self_managed_addons = var.automode ? false : true


  # -------------------------------------------------------
  # Access
  # -------------------------------------------------------

  access_config {
    authentication_mode =  var.authentication_mode

    bootstrap_cluster_creator_admin_permissions = true
  }


  # -------------------------------------------------------
  # VPC
  # -------------------------------------------------------

  vpc_config {
    
    subnet_ids = var.subnet_ids

    endpoint_private_access = var.endpoint_private_access

    endpoint_public_access = var.endpoint_public_access

    public_access_cidrs = var.public_access_cidrs
  }

enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  # -------------------------------------------------------
  # EKS Auto Mode
  # -------------------------------------------------------

  dynamic "compute_config" {
    for_each = var.automode ? [1] : []

    content {
      enabled = true

      node_pools = var.auto_mode_node_pools

      node_role_arn = aws_iam_role.auto_mode_node[0].arn
    }
  }


  dynamic "storage_config" {
    for_each = var.automode ? [1] : []

    content {
      block_storage {
        enabled = true
      }
    }
  }


  dynamic "kubernetes_network_config" {
    for_each = var.automode ? [1] : []

    content {
      elastic_load_balancing {
        enabled = true
      }
    }
  }


  tags = merge(
    local.cluster_tags,
    {
      AutoMode = tostring(var.automode)
    }
  )


  depends_on = [
    aws_iam_role_policy_attachment.cluster,

    aws_iam_role_policy_attachment.cluster_compute,

    aws_iam_role_policy_attachment.cluster_block_storage,

    aws_iam_role_policy_attachment.cluster_load_balancing,

    aws_iam_role_policy_attachment.cluster_networking
  ]
}

# ── Dynamic Access Entries for Admin Principals ──────────────────────────────

resource "aws_eks_access_entry" "admin" {
  for_each      = toset(var.admin_access_entry_principals)
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = each.value
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "admin" {
  for_each      =  toset(var.admin_access_entry_principals)
  cluster_name  = aws_eks_cluster.this.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = each.value

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.admin]
}