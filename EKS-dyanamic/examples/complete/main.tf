module "eks" {
  source = "../.."

  cluster_name    = var.cluster_name
  cluster_version =  var.cluster_version
  automode = true
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  private_subnet_ids = var.private_subnet_ids
  auto_mode_node_pools     = var.auto_mode_node_pools
  endpoint_private_access = var.cluster_endpoint_private_access

  endpoint_public_access = var.cluster_endpoint_public_access

  public_access_cidrs = var.public_access_cidrs
  authentication_mode = var.authentication_mode
  admin_access_entry_principals = var.admin_access_entry_principals
  
  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Owner      = var.Owner
    Department = var.Department
  }


}

