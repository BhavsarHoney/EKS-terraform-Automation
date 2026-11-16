## Eks Cluster Role 
resource "aws_iam_role" "cluster" {
  name = "${var.cluster_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "eks.amazonaws.com"
        }

        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  # tags = local.cluster_tags
}
##attche  clusterrole policy
resource "aws_iam_role_policy_attachment" "cluster" {
  role = aws_iam_role.cluster.name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSClusterPolicy"
}


resource "aws_iam_role_policy_attachment" "cluster_compute" {
  count = var.automode ? 1 : 0

  role = aws_iam_role.cluster.name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSComputePolicy"
}

resource "aws_iam_role_policy_attachment" "cluster_block_storage" {
  count = var.automode ? 1 : 0

  role = aws_iam_role.cluster.name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSBlockStoragePolicy"
}

resource "aws_iam_role_policy_attachment" "cluster_load_balancing" {
  count = var.automode ? 1 : 0

  role = aws_iam_role.cluster.name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSLoadBalancingPolicy"
}

resource "aws_iam_role_policy_attachment" "cluster_networking" {
  count = var.automode ? 1 : 0

  role = aws_iam_role.cluster.name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSNetworkingPolicy"
}

 ## Role for EKS Auto Mode Nodes 
resource "aws_iam_role" "auto_mode_node" {
  count = var.automode ? 1 : 0

  name = "${var.cluster_name}-auto-mode-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = local.cluster_tags
}

resource "aws_iam_role_policy_attachment" "auto_mode_node" {
  count = var.automode ? 1 : 0

  role = aws_iam_role.auto_mode_node[0].name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSWorkerNodeMinimalPolicy"
}

resource "aws_iam_role_policy_attachment" "auto_mode_ecr" {
  count = var.automode ? 1 : 0

  role = aws_iam_role.auto_mode_node[0].name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}

## Eks Node Role 
resource "aws_iam_role" "managed_node" {
  count = var.automode ? 0 : 1

  name = "${var.cluster_name}-managed-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = local.cluster_tags
}

resource "aws_iam_role_policy_attachment" "managed_node_worker" {
  count = var.automode ? 0 : 1

  role = aws_iam_role.managed_node[0].name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "managed_node_cni" {
  count = var.automode ? 0 : 1

  role = aws_iam_role.managed_node[0].name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "managed_node_ecr" {
  count = var.automode ? 0 : 1

  role = aws_iam_role.managed_node[0].name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}
