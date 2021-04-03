# root / main

# utilising the vpc module to create vpc here in root
module "VPC" {
  source = "./VPC"
  vpc_cidr = "10.0.0.0/16"
}
