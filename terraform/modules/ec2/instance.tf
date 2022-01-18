resource "aws_instance" "DP4" {
  count         = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"
  vpc_security_group_ids = var.sg_ids
  iam_instance_profile   = "${var.iam_instance_prfile}"
  key_name               = "${var.key_name}"



  tags = {
    Name = "${var.tag_name}"
    env  = "${var.tag_env}"
    type = "${var.tag_type}"
      }
}