variable "eks_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "ev-app-eks-cluster"
}

variable "eks_version" {
  type        = string
  description = "Version of the EKS cluster"
  default     = "1.31"
}


variable "eks_endpoint_public_access" {
  type        = bool
  description = "Whether to enable public access to the cluster endpoint"
  default     = true
}

variable "eks_endpoint_private_access" {
  type        = bool
  description = "Whether to enable private access to the cluster endpoint"
  default     = true
}

variable "eks_addons" {
  type        = map(any)
  description = "Map of EKS addons to enable"
  default = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }
}

variable "eks_managed_node_group_defaults" {
  type        = any
  description = "Map of default values for managed node groups"
  default = {
    instance_types = ["t2.large"]
  }
}

variable "eks_managed_node_groups" {
  type        = any
  description = "Map of managed node groups to create"
  default = {
    example = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t2.large"]
      min_size       = 2
      max_size       = 10
      desired_size   = 2
    }
  }
}

variable "eks_cluster_creator_admin_permissions" {
  type        = bool
  description = "Whether to enable cluster creator admin permissions"
  default     = true
}