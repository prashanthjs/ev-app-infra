locals {
  alb_name = "${var.environment}-${var.alb_name}"
  alb_tags = {
    Environment = var.environment
    Name        = local.alb_name
    Family      = var.alb_name
    Terraform   = "true"
  }
}

resource "helm_release" "aws_load_balancer_controller" {
  name = local.alb_name

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.4.4"

  set {
    name  = "replicaCount"
    value = 1
  }

  set {
    name  = "clusterName"
    value = module.eks.cluster_name
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.aws_load_balancer_controller_irsa_role.iam_role_arn
  }
}