resource "aws_eip" "tfeip"{
  vpc      = true
  depends_on = ["aws_internet_gateway.gw"]

}

# Create NAT Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.tfeip.id}"
  subnet_id     = "${aws_subnet.public1.id}"
  depends_on = ["aws_internet_gateway.gw"]

}