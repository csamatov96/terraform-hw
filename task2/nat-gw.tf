resource "aws_nat_gateway" "natgw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "nat gateway"
  }
}