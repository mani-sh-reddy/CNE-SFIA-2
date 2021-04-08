# security group / main

resource "aws_security_group" "main_public_sg" {
  name = "main_public_sg"
  description = "security group for 22, 8080, 80 access"
  vpc_id = var.vpc_id

  ingress {
    description = "ssh in"
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = "tcp"
    cidr_blocks = var.all_ip_range
  }

  ingress {
    description = "jenkins in"
    from_port = var.jenkins_port
    to_port = var.jenkins_port
    protocol = "tcp"
    cidr_blocks = var.all_ip_range
  }

  ingress {
    description = "http in"
    from_port = var.http_port
    to_port = var.http_port
    protocol = "tcp"
    cidr_blocks = var.all_ip_range
  }

  egress {
    description = "allow all out"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.all_ip_range
  }
}

# RDS Security group.
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  description = "security group for 3306 and 22 ingress"
  vpc_id = var.vpc_id

  ingress {
    description = "mysql in"
    from_port = var.mysql_port
    to_port = var.mysql_port
    protocol = "tcp"
    #only allowing inside vpc ingress
    cidr_blocks = [var.vpc_cidr_block]
  }

  ingress {
    description = "ssh in"
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = "tcp"
    #only allowing inside vpc ingress
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    description = "allow all out"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.all_ip_range
  }
}