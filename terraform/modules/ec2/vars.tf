variable "ec2_count" {
  default = "1"
}
variable "ami_id" {
  default = "ami-05d34d340fb1d89e5"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "sg_ids"{}
variable "iam_instance_prfile"{
  default = "SSMRole"
}
variable "key_name"{}
variable "tag_name" {}
variable "tag_env" {
  default = "edu"
}
variable "tag_type" {}