resource "aws_iam_role" "fp-eks-cluster-role" {
  name = "FP-EKS-CLUSTER-ROLE"

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

resource "aws_iam_role_policy_attachment" "fp-eks-cluster-role-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.fp-eks-role.name
}

resource "aws_iam_role" "fp-eks-node-group-role" {
  name = "FP-EKS-NODE-GROUP-ROLE"

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

resource "aws_iam_role_policy_attachment" "fp-eks-node-group-role-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.fp-eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "fp-eks-node-group-role-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.fp-eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "fp-eks-node-group-role-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.fp-eks-node-group-role.name
}

resource "aws_eks_cluster" "fp-eks-cluster" {
  name     = "FP-EKS-CLUSTER"
  role_arn = aws_iam_role.fp-eks-cluster.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.fp-eks-cluster-role-AmazonEKSClusterPolicy,
  ]
}


