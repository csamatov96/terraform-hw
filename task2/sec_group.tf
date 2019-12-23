/*resource "aws_security_group" "sec_group" {
  name        = "sec_group" #refer to it by its name 
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-068fa5c2209bdb947" #


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 80
    to_port     = 80
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
