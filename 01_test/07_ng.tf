resource "aws_eip" "sonjisu_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "sonjisu_ng" {
  allocation_id = aws_eip.sonjisu_eip_ng.id
  subnet_id     = aws_subnet.sonjisu_puba[0].id
  tags = {
    "Name" = "sonjisu-ng"
  }
  depends_on = [
    aws_internet_gateway.sonjisu_ig
  ]
}
