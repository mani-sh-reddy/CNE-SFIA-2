# route table / variables

variable "vpc_id" {
}

variable "all_ip_range" {
  default = "0.0.0.0/0"
}

variable "gateway_id" {
}

variable "vpc_default_rt_id" {
}

variable "public_subnet_id" {
}