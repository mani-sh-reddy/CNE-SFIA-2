# internet gateway / main

# gateway module (template)
resource "aws_internet_gateway" "internet_gateway" {
vpc_id = var.vpc_id

  tags = {
    "Name" = "cne_internet_gateway"
  }
}