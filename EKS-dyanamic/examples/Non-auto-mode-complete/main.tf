module "eks" {

    source = "../.."
    
    cluster_name    = var.cluster_name
    cluster_version = var.cluster_version
    automode = false

    vpc_id = var.vpc_id
    subnet_ids = var.subnet_ids
    private_subnet_ids = var.private_subnet_ids

    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access = var.cluster_endpoint_public_access
    public_access_cidrs = var.public_access_cidrs

    authentication_mode = var.authentication_mode
    admin_access_entry_principals = var.admin_access_entry_principals

   ### node group configuration
    node_group_name = var.node_group_name
    node_capacity_type = var.node_capacity_type
    
    ## Scaling configuration
    node_desired_size = var.node_desired_size

    node_max_size = var.node_max_size

    node_min_size = var.node_min_size

    node_disk_size = var.node_disk_size

    tags = {
        Environment = var.environment
        ManagedBy   = "terraform"
        Owner      = var.Owner
        Department = var.department
    }
  
}