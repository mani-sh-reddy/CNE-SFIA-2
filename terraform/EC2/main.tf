# ec2 / main
resource "aws_instance" "cne_ec2" {
  instance_type = var.ec2_instance_type
  ami = var.ec2_ami_id

  vpc_security_group_ids = [var.main_sg_id]
  subnet_id = var.public_subnet_id
  
  root_block_device {
    volume_size = 8
  }

   key_name = var.key_pair_id

  tags = {
    "Name" = var.ec2_tag_name
  }

}