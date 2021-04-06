# root / main

# utilising the vpc module in root inorder to create vpc
module "VPC" {
  source = "./VPC"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = "10.0.2.0/24" # even ip for public
  private_subnet_cidr = "10.0.1.0/24" # odd ip for private
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
  vpc_id = module.VPC.vpc_id
  gateway_id = module.GATEWAY.gateway_id
  vpc_default_rt_id = module.VPC.vpc_default_rt_id
  public_subnet_id = module.VPC.public_subnet_id
}