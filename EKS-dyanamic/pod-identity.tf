resource "aws_eks_pod_identity_association" "this" {
  for_each = var.pod_identity_associations

  cluster_name = aws_eks_cluster.this.name

  namespace = each.value.namespace

  service_account = each.value.service_account

  role_arn = each.value.role_arn
}
