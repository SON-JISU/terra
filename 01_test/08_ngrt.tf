resource "aws_route_table" "sonjisu_ngrt" {
  vpc_id = aws_vpc.sonjisu_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.sonjisu_ng.id
  }

  tags = {
    "Name" = "sonjisu-ngrt"
  }
  
}