resource "aws_autoscaling_attachment" "sonjisu_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.sonjisu_asg.id
  alb_target_group_arn = aws_lb_target_group.sonjisu_albtg.arn
}