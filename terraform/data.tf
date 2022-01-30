data "aws_ami" "ama2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "redhat" {
  owners      = ["309956199498"]
  most_recent = true
  filter {
    name   = "name"
    values = ["RHEL_HA-8.4.0_HVM-*-x86_64-2-Hourly2-GP2"]
  }
}