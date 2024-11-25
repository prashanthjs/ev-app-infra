locals {
  vpc_name = "${var.environment}-${var.vpc_name}"
  vpc_tags = {
    Environment = var.environment
    Name        = local.vpc_name
    Family      = var.vpc_name
    Terraform   = "true"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0.0"

  name = local.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
  intra_subnets   = var.vpc_intra_subnets

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.vpc_tags
}