variable "aws_access_key" {
  default = "AKIARB7W6ZDWY4V5PL6W"
}

variable "aws_secret_key" {
  default = "1ahmXIpXscCuM7ZpugtOwY9pgixyNCWLuzE32ESY"
}

variable "region" {
  default = "us-east-1"
}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidr_blocks" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "eks_cluster_role" {
  type    = string
  default = "eks-role"
}
variable "eks_cluster_name" {
  type    = string
  default = "eks-cluster"
}

variable "eks_version" {
  type    = string
  default = "1.25"
}

variable "eks_node_group_iam" {
  type    = string
  default = "eks-node-iam"
}
variable "eks_node_group" {
  type    = string
  default = "eks-node-group"
}
variable "scaling_size" {
  type    = number
  default = 4
}

variable "max_scaling_size" {
  type    = number
  default = 6
}

variable "openid_client_id" {
  type    = list(string)
  default = ["sts.amazonaws.com"]
}

variable "aws_load_balancer_controller_role_name" {
  type    = string
  default = "aws-load-balancer-controller"
}

variable "aws_load_balancer_controller_policy_file_path" {
  type    = string
  default = "./AWSLoadBalancerController.json"
}
