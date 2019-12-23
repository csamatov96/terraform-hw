resource "aws_eip" "tfeip"{
  vpc      = true
  depends_on = ["aws_internet_gateway.gw"]

}

# Create NAT Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.tfeip.id}"
  subnet_id  = "${element(data.aws_subnet_ids.public1.ids, 0)}"
  depends_on = ["aws_internet_gateway.gw"]

}