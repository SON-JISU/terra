# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "sonjisu_ig" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  tags = {
    Name = "sonjisu-ig"
  }
}