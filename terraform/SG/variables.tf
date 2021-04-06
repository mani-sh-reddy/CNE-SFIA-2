# security group / variables

variable "vpc_id" {
  type = string
}

variable "all_ip_range" {
  default = ["0.0.0.0/0"]
}

variable "public_subnet_cidr" {
}

