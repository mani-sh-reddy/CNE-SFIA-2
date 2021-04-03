# vpc / main

# vpc module (template)
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  # allows you to have a dns url for public resources.
  enable_dns_hostnames = true 
  enable_dns_support = true

  tags = {
    "Name" = "vpc_cne"
  }
}