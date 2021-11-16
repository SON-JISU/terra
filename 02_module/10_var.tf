variable "name" {
  type = string
  default = "sonjisu"  
}

variable "region" {
  type = string
  default = "ap-northeast-2"  
}

variable "ava" {
  type = list(string)
  default = ["a","c"]
}
variable "key" {
  type = string
  default = "sonjisu1-key"
}

variable "cidr_main" {
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_public" {
  type = list(string)
  default = ["10.0.0.0/24","10.0.2.0/24"]   
}

variable "cidr_private" {
  type = list(string)
  default = [ "10.0.1.0/24","10.0.3.0/24" ]
}

variable "cidr_privatedb" {
  type = list(string)
  default = [ "10.0.4.0/24","10.0.5.0/24" ]
}

variable "cidr_route" {
  type = string
  default = "0.0.0.0/0" 
}

variable "cidr_ipv6" {
  type = string
  default = "::/0"
}

variable "port_http" {
  type = number
  default = 80  
}

variable "port_ssh" {
  type = number
  default = 22  
}

variable "port_mysql" {
  type = number
  default = 3306  
}

variable "port_zero" {
  type = number
  default = 0  
}

variable "protocol_tcp" {
  type = string
  default = "tcp"
}  
 
variable "protocol_minus" {
  type = number
  default = -1
}

variable "instance_type" {
  type = string
  default = "t2.micro"  
}

variable "private_ip" {
  type = string
  default = "10.0.0.11"
}

variable "lb_type" {
  type = string
  default = "application"
}

variable "protocol_http" {
  type = string
  default = "HTTP"
}

variable "storage_size" {
  type = number
  default = 20
}

variable "storage_type" {
  type = string
  default = "gp2"  
}

variable "sql_type" {
  type = string
  default = "mysql"
}

variable "mysql_ver" {
  type = string
  default = "8.0"  
}

variable "db_instance" {
  type = string
  default = "db.t2.micro"
}

variable "db_name" {
  type = string
  default = "test"  
}

variable "db_username" {
  type = string
  default = "admin"
}

variable "db_passwd" {
  type = string
  default = "It12345!"
}

