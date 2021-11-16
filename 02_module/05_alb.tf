resource "aws_lb" "sonjisu_alb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = var.lb_type
  security_groups = [aws_security_group.sonjisu_sg.id]
  subnets = [aws_subnet.sonjisu_pub[0].id,aws_subnet.sonjisu_pub[1].id] # loadbalancer 가

  tags = {
    "Name" = "${var.name}-alb"
  } 
}

output "alb_dns" {
  value = aws_lb.sonjisu_alb.dns_name
}

resource "aws_lb_target_group" "sonjisu_albtg" {
  name = "${var.name}-albtg"
  port = var.port_http
  protocol = var.protocol_http
  target_type = "instance"
  vpc_id = aws_vpc.sonjisu_vpc.id
  
  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 5
    matcher = "200"
    path = "/health.html"
    port = "traffic-port"
    protocol = var.protocol_http
    timeout = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "sonjisu_albli" {
  load_balancer_arn = aws_lb.sonjisu_alb.arn
  port = var.port_http
  protocol = var.protocol_http

default_action {
  type = "forward"
  target_group_arn = aws_lb_target_group.sonjisu_albtg.arn
  }
}

resource "aws_lb_target_group_attachment" "sonjisu_tgatt" {
  target_group_arn = aws_lb_target_group.sonjisu_albtg.arn
  target_id = aws_instance.sonjisu_web.id
  port = var.port_http
}