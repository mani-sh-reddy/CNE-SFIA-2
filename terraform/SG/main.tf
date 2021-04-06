# security group / main

resource "aws_security_group" "cne_security_group" {
  name = "cne_security_group"
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

# 1. ssh from anywhere in the security group
# 2. setup vm ip ingress