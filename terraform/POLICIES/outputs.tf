output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}
output "eks_cluster_policy" {
  value = aws_iam_role_policy_attachment.eks_cluster_role-AmazonEKSClusterPolicy
}
output "eks_cluster_rc_policy" {
  value = aws_iam_role_policy_attachment.eks_cluster_role-AmazonEKSVPCResourceController
}

output "node_group_role_arn" {
  value = aws_iam_role.node_group_role.arn
}
output "worker_node_policy" {
  value = aws_iam_role_policy_attachment.eks_cluster_role-AmazonEKSWorkerNodePolicy
}
output "eks_cni_policy" {
  value = aws_iam_role_policy_attachment.eks_cluster_role-AmazonEKS_CNI_Policy
}
output "container_reg_read_only" {
  value = aws_iam_role_policy_attachment.eks_cluster_role-AmazonEC2ContainerRegistryReadOnly
}


