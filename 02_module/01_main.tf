provider "aws" {
    region = var.region
}

resource "aws_key_pair" "sonjisu1-key" {
  key_name = var.key
    #  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3qzKR6CMm1TLMOkE3VVgmlCF/4RZhEMW9ivLZcRuOAyllPeO+P2XLPLVFJ/8anfTnlOdnQWQk+hjBeOwLMdR9qaaApOGtBJnXGLnQo2iNpK5xn+Rpob2OlccGMiip9e4e0SkITR4tA/gbJ7JwIjSq6f2Fo2/q0vn9htM5lHFwjcm2MUdYHWZkfdbXRAd9+24TKPbxQcdy9gcSL/8EAUSdl/bjb8Fx9Nvfb+O0970JjeS29KQHSuQowGbDEMGfhRn5e4ixLyZXBRIq732CMXTVppxOJy7b1cteQZmyVJlhHrrqF8G7wXIsAoJTmbw9FfUFUqWuyzUMODnv2o772e4CwBJvbY6tLBQhOU4rlHZ7TSJGtZhOHOxvHaGz4bE3LaBEpw+NGJ0F5PabzY/ZbU0/QRn1/dhumdtB7oB3LoBxidFzN71/wX2W8GYkEXou35i0wTxNfSZvBcQCVskiSc+j6sPfrdF9/pNj7CSu9AN64ySCq8sYprI8Ln/duVZYt2M=
  public_key = file("../../.ssh/sonjisu-key.pub")
}

resource "aws_vpc" "sonjisu_vpc" {
  cidr_block = var.cidr_main
  tags = {
    "Name" = "$(var.name)-vpc"
  }
}

# 가용 영역 - public subnet
resource "aws_subnet" "sonjisu_pub" {
    count = length(var.cidr_public) #2
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = var.cidr_public[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
}

# 가용 영역  private subnet
resource "aws_subnet" "sonjisu_pri" {
  count = length(var.cidr_private)
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = var.cidr_private[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.ava[count.index]}"
  }
}

# 가용 영역 private DB subnet
resource "aws_subnet" "sonjisu_pridb" {
  count = length(var.cidr_privatedb)
  vpc_id = aws_vpc.sonjisu_vpc.id
  cidr_block = var.cidr_privatedb[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pridb${var.ava[count.index]}"
  }
}


# 가용 영역 c - public subnet
#resource "aws_subnet" "sonjisu_pubc" {
#  vpc_id = aws_vpc.sonjisu_vpc.id
#  cidr_block = "10.0.2.0/24"
#  availability_zone = "ap-northeast-2c"
#  tags = {
#    "Name" = "sonjisu-pubc"
# }
#}

# 가용 영역 c - private subnet
#resource "aws_subnet" "sonjisu_pric" {
#  vpc_id = aws_vpc.sonjisu_vpc.id
#  cidr_block = "10.0.3.0/24"
#  availability_zone = "ap-northeast-2c"
#  tags = {
#    "Name" = "sonjisu-pric"
#  }
#}

# 가용 영역 c - private DB subnet
#resource "aws_subnet" "sonjisu_pridbc" {
#  vpc_id = aws_vpc.sonjisu_vpc.id
#  cidr_block = "10.0.5.0/24"
#  availability_zone = "ap-northeast-2c"
#  tags = {
#    "Name" = "sonjisu-pridbc"
#  }
#}