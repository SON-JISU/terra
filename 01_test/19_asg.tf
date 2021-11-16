resource "aws_autoscaling_group" "sonjisu_asg" {
  name = "sonjisu-asg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 10
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.sonjisu_aslc.name
  vpc_zone_identifier = [aws_subnet.sonjisu_puba.id,aws_subnet.sonjisu_pubc.id]
}