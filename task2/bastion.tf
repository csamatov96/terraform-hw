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

resource "aws_security_group" "sec_group" {
  name        = "allow_ssh" #refer to it by its name 
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-028708f18eb20462c" #ID of created VPC


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
