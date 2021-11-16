resource "aws_db_instance" "sonjisu_rds" {
  allocated_storage = var.storage_size
  storage_type = var.storage_type
  engine = var.sql_type
  engine_version = var.mysql_ver

  instance_class = var.db_instance
  name = var.db_name
  identifier = var.db_name
  username = var.db_username
  password = var.db_passwd
  parameter_group_name = "default.mysql8.0"
  availability_zone = "${var.region}${var.ava[0]}"
  db_subnet_group_name = aws_db_subnet_group.sonjisu_dbsb.id
  vpc_security_group_ids = [aws_security_group.sonjisu_sg.id]
  skip_final_snapshot = true 
  tags = {
    "Name" = "${var.name}-rds"
  }
}

resource "aws_db_subnet_group" "sonjisu_dbsb" {
  name = "${var.name}-dbsb-group"
  subnet_ids = [aws_subnet.sonjisu_pridb[0].id,aws_subnet.sonjisu_pridb[1].id]
  tags = {
    "Name" = "${var.name}-dbsb-gp"
  }
}