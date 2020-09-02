#create IAM role for EKS Cluster
resource "aws_iam_role" "fp-eks-cluster-role" {
  name = "FP-EKS-CLUSTER-ROLE"

  #define policy
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# Attach policy
resource "aws_iam_role_policy_attachment" "fp-eks-cluster-role-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.fp-eks-cluster-role.name
}

# Create IAM role for EKS Node Group
resource "aws_iam_role" "fp-eks-node-group-role" {
  name = "FP-EKS-NODE-GROUP-ROLE"

  # Define policy
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

# Attach policy
resource "aws_iam_role_policy_attachment" "fp-eks-node-group-role-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.fp-eks-node-group-role.name
}

# Attach Policy
resource "aws_iam_role_policy_attachment" "fp-eks-node-group-role-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.fp-eks-node-group-role.name
}

# Attach Policy
resource "aws_iam_role_policy_attachment" "fp-eks-node-group-role-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.fp-eks-node-group-role.name
}

# Define cluster
resource "aws_eks_cluster" "fp-eks-cluster" {
  name     = "FP-EKS-CLUSTER"
  role_arn = aws_iam_role.fp-eks-cluster-role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.fp-eks-cluster-role-AmazonEKSClusterPolicy,
  ]
}

# Define node group
resource "aws_eks_node_group" "fp-eks-node-group" {
  cluster_name    = aws_eks_cluster.fp-eks-cluster.name
  node_group_name = "fp-eks-node-group"
  node_role_arn   = aws_iam_role.fp-eks-node-group-role.arn
  subnet_ids      = var.subnet_ids #aws_subnet.fp-eks-node-group[*].id
  instance_types  = [var.instance]
  tags = {
    Name = "K8-Worker"
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.fp-eks-node-group-role-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.fp-eks-node-group-role-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.fp-eks-node-group-role-AmazonEC2ContainerRegistryReadOnly,
  ]
}
