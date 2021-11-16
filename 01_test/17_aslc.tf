resource "aws_launch_configuration" "sonjisu_aslc" {
  name_prefix = "sonjisu-web-"
  image_id = aws_ami_from_instance.sonjisu_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.sonjisu_sg.id]
  key_name = "sonjisu1-key"
  #  user_data = file("./install.sh")

lifecycle {
    create_before_destroy = true 
  }
}