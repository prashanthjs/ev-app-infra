region = "us-east-1"
environment = "prod"

vpc_name = "ev-app-infra-vpc"
vpc_cidr = "11.0.0.0/16"
vpc_azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets = ["11.0.101.0/24", "11.0.102.0/24", "11.0.103.0/24"]
vpc_public_subnets = ["11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]
vpc_intra_subnets = ["11.0.123.0/24", "11.0.124.0/24", "11.0.125.0/24"]

eks_name = "ev-app-eks-cluster"
eks_version = "1.31"
eks_endpoint_public_access = true
eks_endpoint_private_access = true
eks_addons = {
  coredns                = {}
  eks-pod-identity-agent = {}
  kube-proxy             = {}
  vpc-cni                = {}
}
eks_managed_node_group_defaults = {
  instance_types = ["t2.large"]
}
eks_managed_node_groups = {
  ev-node-group = {
    ami_type       = "AL2023_x86_64_STANDARD"
    instance_types = ["t2.large"]
    min_size       = 2
    max_size       = 10
    desired_size   = 2
  }
}

eks_cluster_creator_admin_permissions = true

alb_name = "aws-load-balancer-controller"
alb_role_name = "aws-load-balancer-controller-irsa"