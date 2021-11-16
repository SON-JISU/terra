resource "aws_lb_listener" "sonjisu_albli" {
  load_balancer_arn = aws_lb.sonjisu_alb.arn
  port = "80"
  protocol = "HTTP"

default_action {
  type = "forward"
  target_group_arn = aws_lb_target_group.sonjisu_albtg.arn
  }
}