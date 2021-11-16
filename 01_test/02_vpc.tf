resource "aws_vpc" "sonjisu_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "sonjisu-vpc"
  }
}