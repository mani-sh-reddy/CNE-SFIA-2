# root / main

# utilising the vpc module in root inorder to create vpc
module "VPC" {
  source              = "./VPC"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  rds_a_subnet_cidr = var.rds_a_subnet_cidr
  rds_b_subnet_cidr = var.rds_b_subnet_cidr
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
  rds_subnet_a_id = module.VPC.rds_subnet_a_id
  rds_subnet_b_id = module.VPC.rds_subnet_b_id
}


module "SG" {
  source = "./SG"
  
  vpc_cidr_block = var.vpc_cidr

  #accessing the outputs of some modules and sending it to source.
  vpc_id            = module.VPC.vpc_id
}