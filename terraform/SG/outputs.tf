# security group / outputs

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
