aws_region = "ap-south-1"
cluster_name = "complete-eks"
cluster_version = "1.36"
environment = "dev"
Owner = "Haniben.Bhavsar@einfochips.com"
Department = "PES-IA"
vpc_id = "vpc-3973fe50"

subnet_ids = [
 "subnet-0591c010806e9292f",
 "subnet-05145a489eefa57a0", 
 "subnet-061beab7f94c08acb",
 "subnet-07a544dd2e49680d4"

]

private_subnet_ids = [
  "subnet-0591c010806e9292f",
  "subnet-05145a489eefa57a0",
]

cluster_endpoint_private_access      = true
cluster_endpoint_public_access       = true
auto_mode_node_pools = ["general-purpose", "system"]
authentication_mode  = "API_AND_CONFIG_MAP"
public_access_cidrs = ["182.76.141.104/29",
 "115.112.142.32/29", 
"14.97.73.248/29"]
admin_access_entry_principals = ["arn:aws:iam::454143665149:user/jignesh.vala@einfochips.com"]






