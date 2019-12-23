/*resource "aws_security_group" "allow_ssh" {
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
*/