# vpc / variables

# 10.0.x.x range
variable "vpc_cidr" {
  type = string
    # there shouldn't be a default value for cidr here 
    # because setting this as a module (template)
}

# defines public subnet inside vpc
variable "public_subnet_cidr" {
  type = string
}

variable "rds_a_subnet_cidr" {
  type = string
}

variable "rds_b_subnet_cidr" {
  type = string
}

variable "eks_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}