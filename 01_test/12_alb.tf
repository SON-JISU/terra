resource "aws_lb" "sonjisu_alb" {
  name = "sonjisu-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sonjisu_sg.id]
  subnets = [aws_subnet.sonjisu_pub[0].id,aws_subnet.sonjisu_pub[1].id] # loadbalancer 가

  tags = {
    "Name" = "sonjisu-alb"
  } 
}

output "alb_dns" {
  value = aws_lb.sonjisu_alb.dns_name
}