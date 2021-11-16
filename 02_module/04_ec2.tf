resource "aws_security_group" "sonjisu_sg" {
  name        = "Allow Basic"
  description = "Allow HTTP,SSH,SQL,ICMP"
  vpc_id      = aws_vpc.sonjisu_vpc.id

  ingress = [
    {
      description      = "Allow HTTP"
      from_port        = var.port_http
      to_port          = var.port_http
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "Allow SSH"
      from_port        = var.port_ssh
      to_port          = var.port_ssh
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "Allow SQL"
      from_port        = var.port_mysql
      to_port          = var.port_mysql
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "Allow ICMP" 
      from_port        = var.port_zero
      to_port          = var.port_zero
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  egress = [
    {
      description      = "ALL"
      from_port        = var.port_zero
      to_port          = var.port_zero
      protocol         = var.protocol_minus
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  tags = {
    Name = "$(var.name)-sg"
  }
}

/*
data "aws_ami" "amzn" {
  most_recent = true

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


resource "aws_instance" "sonjisu_web" { 
  ami                    = "ami-04e8dfc09b22389ad" #data.aws_ami.amzn.id 
  instance_type          = var.instance_type
  key_name               = var.key
  availability_zone      = "${var.region}${var.ava[0]}"
#  private_ip             = var.private_ip
  subnet_id              = aws_subnet.sonjisu_pub[0].id
  vpc_security_group_ids = [aws_security_group.sonjisu_sg.id]
  user_data              = file("./install.sh")
}

resource "aws_eip" "sonjisu_web_ip" {
  vpc                       = true
  instance                  = aws_instance.sonjisu_web.id
#  associate_with_private_ip = var.private_ip
  depends_on = [
    aws_internet_gateway.sonjisu_ig
  ]

}

output "public_ip" {
  value = aws_instance.sonjisu_web.public_ip
}
