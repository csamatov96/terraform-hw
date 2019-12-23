resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private1.id 
  route_table_id = aws_route_table.r2.id
}
resource "aws_route_table_association" "e" {
  subnet_id      = aws_subnet.private2.id 
  route_table_id = aws_route_table.r2.id
}
resource "aws_route_table_association" "f" {
  subnet_id      = aws_subnet.private3.id 
  route_table_id = aws_route_table.r2.id
}