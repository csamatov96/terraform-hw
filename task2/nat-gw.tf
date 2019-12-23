data "aws_nat_gateway" "ngw" {
  subnet_id = "${aws_subnet.private1.id}"

  tags = {
    Name = "gw NAT"
  }
}