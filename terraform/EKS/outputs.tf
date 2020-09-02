output "endpoint" {
  value = aws_eks_cluster.fp-eks-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.fp-eks-cluster.certificate_authority[0].data
}