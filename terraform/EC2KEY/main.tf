# ec2key / main

resource "aws_key_pair" "cne_key_authentication" {
  key_name = var.key_name
  # not hardcoding the key because when the management VM creates the ec2 it can then use its own public key in the ssh folder, this would then let ansible SSH into to the VMs created by terraform
  public_key = file(var.public_key_path)
}