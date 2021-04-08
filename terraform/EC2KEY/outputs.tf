# ec2key / outputs

output "key_pair_id" {
   value = aws_key_pair.cne_key_authentication.id
}