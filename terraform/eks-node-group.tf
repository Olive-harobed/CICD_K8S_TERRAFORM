resource "aws_iam_role" "nodes_group" {
  name               = var.eks_node_group_iam
  assume_role_policy = <<POLICY

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY   
}

resource "aws_iam_role_policy_attachment" "amazon_worker_node_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes_group.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes_group.name
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes_group.name
}

resource "aws_eks_node_group" "nodes_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.eks_node_group
  node_role_arn   = aws_iam_role.nodes_group.arn
  subnet_ids      = aws_subnet.private.*.id
  scaling_config {
    desired_size = var.scaling_size
    max_size     = var.max_scaling_size
    min_size     = var.scaling_size
  }
  instance_types       = ["t3.medium"]
  ami_type             = "AL2_x86_64"
  force_update_version = false
  labels = {
    role = "worker"
  }
  depends_on = [
    aws_iam_role_policy_attachment.amazon_worker_node_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general
  ]
}

