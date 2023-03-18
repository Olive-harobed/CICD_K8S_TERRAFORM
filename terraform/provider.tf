terraform {
  cloud {
    organization = "harobed"

    workspaces {
      name = "cicd"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    namedotcom = {
      source  = "lexfrei/namedotcom"
      version = "1.2.4"
    }
    kubernetes = {
    source  = "hashicorp/kubernetes"
    version = "~> 2.4"
    }
  }
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = var.region
}

provider "kubernetes" {  
  host                   = aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.eks.id]
    command     = "aws"
  } 
}