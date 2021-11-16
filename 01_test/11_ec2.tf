/*
data "aws_ami" "amzn" {
  most_recent =

  filter {
    name  = "name"
    values = ["amzn2-ami-hvm-*x86-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

    owners = ["amazon"]
}
*/


resource "aws_instance" "sonjisu_weba" {
  ami = "ami-04e8dfc09b22389ad"
  instance_type = "t2.micro"
  key_name = "sonjisu1-key" 
  availability_zone = "ap-northeast-2a"
  private_ip = "10.0.0.11"
  subnet_id = aws_subnet.sonjisu_pub[0].id
  vpc_security_group_ids = [aws_security_group.sonjisu_sg.id]
  user_data = file("./install.sh")
}

resource "aws_eip" "sonjisu_weba_ip" {
  vpc = true
  instance = aws_instance.sonjisu_weba.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.sonjisu_ig
  ]

}

output "public_ip" {
  value = aws_instance.sonjisu_weba.public_ip
}