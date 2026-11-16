cluster_name = "EKS-Non-Auto-Mode-Complete"

cluster_version = "1.36"

environment = "dev"

Owner = "Haniben.Bhavsar@einfochip.com"

department = "PES-IA"

vpc_id = "vpc-3973fe50"

subnet_ids = [ 
  "subnet-061beab7f94c08acb",
  "subnet-07a544dd2e49680d4",
  "subnet-0591c010806e9292f",
  "subnet-05145a489eefa57a0"
]

private_subnet_ids = [
  "subnet-0591c010806e9292f",
  "subnet-05145a489eefa57a0"
]

cluster_endpoint_private_access = true

cluster_endpoint_public_access = true

public_access_cidrs = ["182.76.141.104/29",
 "115.112.142.32/29", 
"14.97.73.248/29"]

authentication_mode = "API_AND_CONFIG_MAP"

admin_access_entry_principals = ["arn:aws:iam::454143665149:user/jignesh.vala@einfochips.com"]

node_group_name = "eks-node-group"

node_capacity_type = "ON_DEMAND"

node_desired_size = 2

node_max_size = 3

node_min_size = 1

node_disk_size = 20













