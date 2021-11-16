resource "aws_route_table" "sonjisu_rt" {
  vpc_id = aws_vpc.sonjisu_vpc.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sonjisu_ig.id
  }
  tags = {
    "Name" = "sonjisu-rt"
  }  
}