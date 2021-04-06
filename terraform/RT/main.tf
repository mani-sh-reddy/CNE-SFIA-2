# route table / main

resource "aws_route_table" "public_route_table" {
vpc_id = var.vpc_id

  tags = {
    "Name" = "cne_public_rt"
  }
}

# connecting the public route table to the public subnet using route table association.
resource "aws_route_table_association" "public_rt_association" {
  subnet_id = var.public_subnet_id
  route_table_id = aws_route_table.public_route_table.id
}

# connecting the public route table to the rds subnetgroup using route table association.
# SUBNET A
resource "aws_route_table_association" "rds_subnet_a_rt_association" {
  subnet_id = var.rds_subnet_a_id
  route_table_id = aws_route_table.public_route_table.id
}
# SUBNET B
resource "aws_route_table_association" "rds_subnet_b_rt_association" {
  subnet_id = var.rds_subnet_b_id
  route_table_id = aws_route_table.public_route_table.id
}

# setting the default route for extra security
# when the ec2 wamts to access outside of network, it will default to go through internet gateway.
resource "aws_route" "default_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = var.all_ip_range
  gateway_id = var.gateway_id
}


# default route table is what the subnets will use if they havn't explicitely been given the route table to use. (its the private route table)
resource "aws_default_route_table" "default_route_table" {
  #specifying that the default route table that's used by the vpc is this one.
  #can override it but this is the default.
  default_route_table_id = var.vpc_default_rt_id

  tags = {
    "Name" = "cne_rt_default"
  }
}

