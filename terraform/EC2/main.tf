# ec2 / main
resource "aws_instance" "cne_ec2" {
  instance_type = var.ec2_instance_type
  ami = var.ec2_ami_id

  vpc_security_group_ids = [var.main_sg_id]
  subnet_id = var.public_subnet_id
  
  root_block_device {
    volume_size = 8
  }

   key_name = aws_key_pair.cne_key_authentication.id

  tags = {
    "Name" = var.ec2_tag_name
  }

}

resource "aws_key_pair" "cne_key_authentication" {
  key_name = var.key_name
  # not hardcoding the key because when the management VM creates the ec2 it can then use its own public key in the ssh folder, this would then let ansible SSH into to the VMs created by terraform
  public_key = file(var.public_key_path)
}