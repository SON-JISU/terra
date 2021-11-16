# 가용 영역 a - public subnet
resource "aws_subnet" "sonjisu_puba" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "sonjisu-puba"
  }
}

# 가용 영역 a - private subnet
resource "aws_subnet" "sonjisu_pria" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "sonjisu-pria"
  }
}

# 가용 영역 c - public subnet
resource "aws_subnet" "sonjisu_pubc" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "sonjisu-pubc"
  }
}

# 가용 영역 c - private subnet
resource "aws_subnet" "sonjisu_pric" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "sonjisu-pric"
  }
}

# 가용 영역 a - private DB subnet
resource "aws_subnet" "sonjisu_pridba" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "sonjisu-pridba"
  }
}

# 가용 영역 c - private DB subnet
resource "aws_subnet" "sonjisu_pridbc" {
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "sonjisu-pridbc"
  }
}