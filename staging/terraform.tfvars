# VPC Configuration
vpc_cidr_block     = "10.0.0.0/16" # ADJUST
availability_zones = ["ap-southeast-3a", "ap-southeast-3b", "ap-southeast-3c"] # ADJUST

# Subnet Configuration
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] # ADJUST
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"] # ADJUST

# DNS Configuration
enable_dns_support   = true
enable_dns_hostnames = true

# NAT Gateway Configuration
single_nat_gateway = true # ADJUST: true = single NAT (cost-effective), false = per-AZ (HA)

# VPC Flow Logs Configuration
enable_flow_logs         = false # ADJUST
flow_logs_destination    = "cloudwatch" # ADJUST: "cloudwatch" or "s3"
flow_logs_retention_days = 7 # ADJUST
flow_logs_s3_bucket_arn  = "" # ADJUST: Required if flow_logs_destination is "s3"
