resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id 
  route_table_id = aws_route_table.r.id
}
resource "aws_route_table_association" "b" {
  gateway_id     = aws_internet_gateway.gw.id
  route_table_id = aws_route_table.r.id
}