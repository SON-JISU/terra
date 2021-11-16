resource "aws_route_table_association" "sonjisu_rtas_a" {
  subnet_id      = aws_subnet.sonjisu_puba.id
  route_table_id = aws_route_table.sonjisu_rt.id
}

resource "aws_route_table_association" "sonjisu_rtas_c" {
  subnet_id      = aws_subnet.sonjisu_pubc.id
  route_table_id = aws_route_table.sonjisu_rt.id
}
