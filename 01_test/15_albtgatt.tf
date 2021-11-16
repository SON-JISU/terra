resource "aws_lb_target_group_attachment" "sonjisu_tgatt" {
  target_group_arn = aws_lb_target_group.sonjisu_albtg.arn
  target_id = aws_instance.sonjisu_weba.id
  port = 80
}