

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "private_subnet_green_cidr" {
  default = "10.0.1.0/24"
}
variable "private_subnet_blue_cidr" {
  default = "10.0.2.0/24"
}
variable "public_subnet_green_cidr" {
  default = "10.0.100.0/24"
}
variable "public_subnet_blue_cidr" {
  default = "10.0.110.0/24"
}

variable "db_subnet_cidr" {
  default = "10.0.255.0/24"
}

