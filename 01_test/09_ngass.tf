resource "aws_route_table_association" "sonjisu_ngass_a" {
  subnet_id = aws_subnet.sonjisu_pria.id
  route_table_id = aws_route_table.sonjisu_ngrt.id  
}

resource "aws_route_table_association" "sonjisu_ngass_c" {
  subnet_id = aws_subnet.sonjisu_pric.id
  route_table_id = aws_route_table.sonjisu_ngrt.id  
}