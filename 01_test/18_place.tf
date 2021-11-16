resource "aws_placement_group" "sonjisu_place" {
  name = "sonjisu-place"
  strategy = "cluster"
}