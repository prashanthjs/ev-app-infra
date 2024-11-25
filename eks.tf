locals {
  eks_name = "${var.environment}-${var.eks_name}"
  eks_tags = {
    Environment = var.environment
    Name        = local.eks_name
    Family      = var.eks_name
    Terraform   = "true"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.29.0"

  cluster_name    = local.eks_name
  cluster_version = var.eks_version

  cluster_endpoint_public_access  = var.eks_endpoint_public_access
  cluster_endpoint_private_access = var.eks_endpoint_private_access

  cluster_addons =var.eks_addons



  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults

  eks_managed_node_groups = var.eks_managed_node_groups

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = var.eks_cluster_creator_admin_permissions

  tags = local.eks_tags
}
