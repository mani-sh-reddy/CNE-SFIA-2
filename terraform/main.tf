# root / main

# utilising the vpc module in root inorder to create vpc
module "VPC" {
  source              = "./VPC"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  rds_a_subnet_cidr   = var.rds_a_subnet_cidr
  rds_b_subnet_cidr   = var.rds_b_subnet_cidr
  eks_subnet_cidr = var.eks_subnet_cidr
}

module "GATEWAY" {
  source = "./GATEWAY"

  #accessing the output of the VPC module and sending it to source.
  vpc_id = module.VPC.vpc_id

}


# route table.
module "RT" {
  source = "./RT"

  #accessing the outputs of some modules and sending it to source.
  vpc_id            = module.VPC.vpc_id
  gateway_id        = module.GATEWAY.gateway_id
  vpc_default_rt_id = module.VPC.vpc_default_rt_id
  public_subnet_id  = module.VPC.public_subnet_id
  eks_subnet_id  = module.VPC.eks_subnet_id
  rds_subnet_a_id   = module.VPC.rds_subnet_a_id
  rds_subnet_b_id   = module.VPC.rds_subnet_b_id
}


module "SG" {
  source = "./SG"

  vpc_cidr_block = var.vpc_cidr

  #accessing the outputs of some modules and sending it to source.
  vpc_id = module.VPC.vpc_id
}

# i think this will create in both the subnets automatically because i mentioned the subnet group name.
module "TEST_RDS" {
  source = "./RDS"
  db_storage = 10
  db_engine = "mysql"
  db_engine_version = "5.7.22"
  db_instance_type = "db.t2.micro"
  db_subnet_group = module.VPC.rds_subnet_group_name
  sg_id = module.SG.rds_sg_id
  db_name = var.test_db_name
  db_username = var.db_username
  db_password = var.db_password
  db_skip_final_snapshot = true
  db_identifier = "cne-test-db"
}

module "PROD_RDS" {
  source = "./RDS"
  db_storage = 10
  db_engine = "mysql"
  db_engine_version = "5.7.22"
  db_instance_type = "db.t2.micro"
  db_subnet_group = module.VPC.rds_subnet_group_name
  sg_id = module.SG.rds_sg_id
  db_name = var.prod_db_name
  db_username = var.db_username
  db_password = var.db_password
  db_skip_final_snapshot = true
  db_identifier = "cne-prod-db"
}


# running the ec2 key module to send key to aws
module "EC2KEY" {
  source          = "./EC2KEY"
  key_name        = var.key_name
  public_key_path = var.public_key_path
}


module "CI_EC2" {
  source = "./EC2"

  ec2_tag_name      = "jenkins_ec2"
  ec2_ami_id        = var.ec2_ami_id
  ec2_instance_type = var.ec2_instance_type
  main_sg_id        = module.SG.main_sg_id
  public_subnet_id  = module.VPC.public_subnet_id
  key_pair_id       = module.EC2KEY.key_pair_id
}

module "CI_TEST_EC2" {
  source = "./EC2"

  ec2_tag_name      = "test_ec2"
  ec2_ami_id        = var.ec2_ami_id
  ec2_instance_type = var.ec2_instance_type
  main_sg_id        = module.SG.main_sg_id
  public_subnet_id  = module.VPC.public_subnet_id
  key_pair_id       = module.EC2KEY.key_pair_id
}

# not using anymore...
# module "POLICIES" {
#   source = "./POLICIES"
# }

# module "EKS" {
#   source = "./EKS"

#   cluster_name      = "cne_eks_cluster"
#   cluster_version = 1.17
#   cluster_subnets = [module.VPC.public_subnet_id, module.VPC.eks_subnet_id]
#   vpc_id = module.VPC.vpc_id
 
#   node_group_name = "cne_eks_node_group"
#   node_group_desired_size = 2
#   node_group_min_size = 2
#   node_group_max_size = 4
#   instance_type = "t2.micro" # is this enough power???????

#   eks_cluster_role_arn = module.POLICIES.eks_cluster_role_arn
#   eks_cluster_policy = module.POLICIES.eks_cluster_policy
#   eks_cluster_rc_policy = module.POLICIES.eks_cluster_rc_policy
#   node_group_role_arn = module.POLICIES.node_group_role_arn
#   worker_node_policy = module.POLICIES.worker_node_policy
#   eks_cni_policy = module.POLICIES.eks_cni_policy
#   container_reg_read_only = module.POLICIES.container_reg_read_only

# }