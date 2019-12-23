resource "aws_instance" "web" { 
  count = 1
  ami             = "ami-02eac2c0129f6376b"
  instance_type   = "t2.micro"
  associate_public_ip_address = "true"
  key_name = aws_key_pair.key_resource.key_name
#  security_groups = ["allow_ssh_http"] #refer only by its name not resource name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id

  lifecycle{
    prevent_destroy = false
  }

  tags = {
    Name = "ec2_instance"
  }
}




