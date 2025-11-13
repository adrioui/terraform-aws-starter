terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {}
}

locals {
  environment = "production"
  region      = "ap-southeast-3" # ADJUST
}

# ADJUST
provider "aws" {
  profile = ""
  region  = local.region

  default_tags {
    tags = {
      Environment = title(local.environment)
      ManagedBy   = "Terraform"
    }
  }
}

########## VPC ##########
#########################
module "vpc" {
  source = "../modules/vpc"

  environment          = local.environment
  region               = local.region
  vpc_cidr_block       = var.vpc_cidr_block
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  single_nat_gateway   = var.single_nat_gateway

  # Flow logs configuration
  enable_flow_logs         = var.enable_flow_logs
  flow_logs_destination    = var.flow_logs_destination
  flow_logs_retention_days = var.flow_logs_retention_days
  flow_logs_s3_bucket_arn  = var.flow_logs_s3_bucket_arn
}
