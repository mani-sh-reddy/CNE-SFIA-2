# eks / main
resource "aws_eks_cluster" "cne_eks_cluster" {
  name = var.cluster_name
  version = var.cluster_version
  vpc_config {
    subnet_ids = var.cluster_subnets
  }

   role_arn = var.eks_cluster_role_arn 
   depends_on = [
    var.eks_cluster_policy,
    var.eks_cluster_rc_policy,
  ]
  
}

resource "aws_eks_node_group" "cne_eks_node_group" {
  cluster_name    = aws_eks_cluster.cne_eks_cluster.name
  node_group_name = var.node_group_name

  subnet_ids      = var.cluster_subnets

  instance_types = [var.instance_type]

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }
  
  node_role_arn   = var.node_group_role_arn
    depends_on = [
      var.worker_node_policy,
      var.eks_cni_policy,
      var.container_reg_read_only,
  ]

}
