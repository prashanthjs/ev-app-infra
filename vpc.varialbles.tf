variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "ev-app-infra-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "List of public subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "List of private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_intra_subnets" {
  type        = list(string)
  description = "List of intra subnets"
  default     = ["10.0.123.0/24", "10.0.124.0/24", "10.0.125.0/24"]
}