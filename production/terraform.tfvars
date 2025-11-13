# VPC Configuration
vpc_cidr_block     = "10.1.0.0/16" # ADJUST
availability_zones = ["ap-southeast-3a", "ap-southeast-3b", "ap-southeast-3c"] # ADJUST

# Subnet Configuration
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"] # ADJUST
private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"] # ADJUST

# DNS Configuration
enable_dns_support   = true
enable_dns_hostnames = true

# NAT Gateway Configuration
single_nat_gateway = false # ADJUST: true = single NAT (cost-effective), false = per-AZ (HA)

# VPC Flow Logs Configuration
enable_flow_logs         = true # ADJUST
flow_logs_destination    = "s3" # ADJUST: "cloudwatch" or "s3"
flow_logs_retention_days = 30 # ADJUST
flow_logs_s3_bucket_arn  = "arn:aws:s3:::your-production-flow-logs-bucket" # ADJUST: Required if flow_logs_destination is "s3"
