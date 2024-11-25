variable "alb_name" {
  type        = string
  description = "Name of the ALB"
  default     = "aws-load-balancer-controller"
}

variable "alb_role_name" {
  type        = string
  description = "Name of the ALB role"
  default     = "aws-load-balancer-controller-irsa"
}