# vpc / outputs

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_default_rt_id" {
  value = aws_vpc.vpc.default_route_table_id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "rds_subnet_a_id" {
  value = aws_subnet.rds_subnet_a.id
}
output "rds_subnet_b_id" {
  value = aws_subnet.rds_subnet_b.id
}

output "rds_subnet_group_name" {
  value = aws_db_subnet_group.rds_subnet_group.name
}

output "eks_subnet_id" {
  value = aws_subnet.eks_subnet_x.id
}