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


# using a public subnet group (and subnets) for the RDSs.
# RDS1
resource "aws_subnet" "rds_subnet_a" {
   vpc_id = aws_vpc.vpc.id
   cidr_block = var.rds_a_subnet_cidr
   
   # to set public ip for instances in this subnet
   map_public_ip_on_launch = true

   availability_zone = "eu-west-2a"

  tags = {
    "Name" = "rds_public_subnet_a"
  }
}

# RDS2
resource "aws_subnet" "rds_subnet_b" {
   vpc_id = aws_vpc.vpc.id
   cidr_block = var.rds_b_subnet_cidr
   
   # to set public ip for instances in this subnet
   map_public_ip_on_launch = true

   availability_zone = "eu-west-2b"

  tags = {
    "Name" = "rds_public_subnet_b"
  }
}

# RDS modules will refer to the subnet groups (not the subnets itself).
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.rds_subnet_a.id, aws_subnet.rds_subnet_b.id]

  tags = {
    Name = "RDS subnet group"
  }
}




# not using this subnet due to time and cost constraints - but its here if needed.
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

