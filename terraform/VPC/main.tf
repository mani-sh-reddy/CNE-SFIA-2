# vpc / main

# vpc module (template)
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  # allows you to have a dns url for public resources.
  enable_dns_hostnames = true 
  enable_dns_support = true

  tags = {
    "Name" = "cne_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
   vpc_id = aws_vpc.vpc.id
   cidr_block = var.public_subnet_cidr
   
   # to set public ip for instances in this subnet
   map_public_ip_on_launch = true

   availability_zone = "eu-west-2a"

  tags = {
    "Name" = "cne_public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
   vpc_id = aws_vpc.vpc.id
   cidr_block = var.private_subnet_cidr
   
   # map ip is false for private subnet
   map_public_ip_on_launch = false

   availability_zone = "eu-west-2a"

  tags = {
    "Name" = "cne_private_subnet"
  }
}