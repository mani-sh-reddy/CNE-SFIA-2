# # eks / outputs
# output "cluster_id" {
#     value = aws_eks_cluster.cne_eks_cluster.id
# }

# output "cluster_endpoint" {
#   value       = aws_eks_cluster.cne_eks_cluster.endpoint
# }


# output "cluster_security_group_id" {
#   value       = aws_eks_cluster.cne_eks_cluster.cluster_security_group_id
# }

# output "kubectl_config" {
#   value       = aws_eks_cluster.cne_eks_cluster.kubeconfig
# }

# output "config_map_aws_auth" {
#   description = "A kubernetes configuration to authenticate to this EKS cluster."
#   value       = module.EKS.config_map_aws_auth
# }

# output "region" {
#   description = "AWS region"
#   value       = var.region
# }

# output "cluster_name" {
#   description = "Kubernetes Cluster Name"
#   value       = local.cluster_name
# }