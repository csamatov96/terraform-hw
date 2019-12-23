resource "aws_main_route_table_association" "a" {
  vpc_id         = "${aws_vpc.main.id}"
  subnet_id = ["${aws_subnet.public1}","${aws_subnet.public2}","${aws_subnet.public3}"]
  
  route_table_id = "${aws_route_table.r.id}"
}