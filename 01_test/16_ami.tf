resource "aws_ami_from_instance" "sonjisu_ami" {
  name = "sonjisu-aws-ami"
  source_instance_id = aws_instance.sonjisu_weba.id

  depends_on = [
    aws_instance.sonjisu_weba 
  ]

  tags = {
    "Name" = "sonjisu-ami"
  }
}