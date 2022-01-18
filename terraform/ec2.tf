module "ec2-web1" {
  source    = ".//modules/ec2"
  subnet_id = module.vpc.private_subnet1_id
  sg_ids    = [module.vpc.http_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "web1"
  tag_type  = "web"
}


module "ec2-web2" {
  source = ".//modules/ec2"

  subnet_id = module.vpc.private_subnet2_id
  sg_ids    = [module.vpc.http_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "web2"
  tag_type  = "web"
}


module "ec2-db1" {
  source = ".//modules/ec2"

  subnet_id = module.vpc.private_subnet1_id
  sg_ids    = [module.vpc.http_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "db1"
  tag_type  = "db"
}

