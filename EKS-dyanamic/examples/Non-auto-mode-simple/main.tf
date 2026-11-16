module "eks" {
  source = "../.."

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  automode = false
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  private_subnet_ids = var.private_subnet_ids
  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Owner      = var.Owner
    Department = var.department
  }
}
