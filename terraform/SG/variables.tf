# security group / variables

variable "vpc_id" {
  type = string
}

variable "all_ip_range" {
  default = ["0.0.0.0/0"]
}

variable "http_port" {
  default = "80"
}

variable "jenkins_port" {
  default = "8080"
}

variable "ssh_port" {
  default = "22"
}