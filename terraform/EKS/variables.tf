# eks / variables
variable "cluster_name" {}
variable "cluster_version" {}
variable "subnet" {}
variable "vpc_id" {}

variable "node_group_name" {}

variable "node_group_desired_size" {}
variable "node_group_max_size"     {}
variable "node_group_min_size"     {}

variable "eks_cluster_role_arn"     {}
variable "eks_cluster_policy"     {}
variable "eks_cluster_rc_policy"     {}

variable "node_group_role_arn"     {}
variable "worker_node_policy"     {}
variable "eks_cni_policy"     {}
variable "container_reg_read_only"     {}

