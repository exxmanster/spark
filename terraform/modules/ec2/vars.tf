variable "ec2_count" {
  default = "1"
}
variable "ami_id" {
  default = ""
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
variable "tag_project" {
  default = "DP4"
  
}