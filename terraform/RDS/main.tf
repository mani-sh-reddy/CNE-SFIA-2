# rds / main

resource "aws_db_instance" "cne_rds" {
  allocated_storage    = var.db_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_type
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = [var.sg_id]
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = var.db_skip_final_snapshot
  identifier  = var.db_identifier
  tags                 = {
    "Name" = "cne_rds"
  }
}