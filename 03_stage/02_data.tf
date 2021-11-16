module "stage" {
  source = "../01_test"

  name = "sonjisu"  
  region = "ap-northeast-3"
  ava = ["a","c"]
  key = "sonjisu1-key"
  cidr_main = "10.0.0.0/16"
  cidr_public = ["192.168.0.0/24","192.168.2.0/24"]
  cidr_private = ["192.168.1.0/24","192.168.3.0/24"]
  cidr_privatedb = ["10.0.4.0/24","10.0.5.0/24"]
  cidr_route = "0.0.0.0/0"
  cidr_ipv6 = "::/0"
  port_http = 80
  port_ssh = 22 
  port_mysql =3306
  port_zero = 0
  protocol_tcp = "tcp"
  protocol_minus = -1
  instance_type = "t3.small"
  private_ip = "10.0.0.11"
  lb_type = "application"
  protocol_http = "HTTP"
  ami = "ami-04e8dfc09b22389ad" 
  storage_size = 20
  storage_type = "gp2"
  sql_type = "mysql"
  mysql_ver = "8.0"
  db_instance = "db.t2micro"
  db_name = "test"
  db_username = "admin"
  db_passwd = "It12345!"
}