data "aws_nat_gateway" "ngw" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.private1.id}"

  tags = {
    Name = "gw NAT"
  }
}