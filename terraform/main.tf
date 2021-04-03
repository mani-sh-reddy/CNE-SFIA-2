# root / main

# utilising the vpc module in root inorder to create vpc
module "VPC" {
  source = "./VPC"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr = "10.0.2.0/24" # even ip for public
}