variable "aws_region" {
  default = "eu-west-2"
}

variable "ec2_ami_id" {
  default = "ami-096cb92bb3580c759"
}
variable "ec2_instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "cne_key.pub"
}
variable "public_key_path" {}


variable "aws_access_key" {
  sensitive = true
}
variable "aws_secret_key" {
  sensitive = true
}



variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.2.0/24" # even ip for public
}

variable "rds_a_subnet_cidr" {
  default = "10.0.4.0/24" # even ip for public
}
variable "rds_b_subnet_cidr" {
  default = "10.0.6.0/24" # even ip for public
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24" # odd ip for private
}

variable "eks_subnet_cidr" {
  default = "10.0.8.0/24" # even ip for public
}


variable "test_db_name" {}
variable "prod_db_name" {}
variable "db_username" {
  sensitive = true
}
variable "db_password" {
  sensitive = true
}
