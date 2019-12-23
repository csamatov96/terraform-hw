resource "aws_key_pair" "key_resource" {
  key_name   = "terraform_key"
  public_key = file("~/.ssh/id_rsa.pub")
}