variable "aws_region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.2.0/24" # even ip for public
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24" # odd ip for private
}