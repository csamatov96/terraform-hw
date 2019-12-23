resource "aws_instance" "bastion" { 
  count = 1
  ami             = "ami-02eac2c0129f6376b"
  instance_type   = "t2.micro"
  associate_public_ip_address = "true"
  key_name = aws_key_pair.key_resource.key_name
  security_groups = ["allow_ssh"] #refer only by its name not resource name
}

resource "aws_key_pair" "key_resource" {
  key_name   = "terraform_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

}
