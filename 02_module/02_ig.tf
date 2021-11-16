# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "sonjisu_ig" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  tags = {
    Name = "${var.name}-ig"
  }
}

resource "aws_route_table" "sonjisu_rt" {
  vpc_id = aws_vpc.sonjisu_vpc.id

  route  {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.sonjisu_ig.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }  
}

resource "aws_route_table_association" "sonjisu_rtas" {
  count = length(var.cidr_public)
  subnet_id      = aws_subnet.sonjisu_pub[count.index].id
  route_table_id = aws_route_table.sonjisu_rt.id
}

#resource "aws_route_table_association" "sonjisu_rtas_c" {
#  subnet_id      = aws_subnet.sonjisu_pubc.id
#  route_table_id = aws_route_table.sonjisu_rt.id
#}
