module "ec2-web1" {
  source    = ".//modules/ec2"
  ami_id    = data.aws_ami.ama2.id
  subnet_id = module.vpc.private_subnet_green_id
  sg_ids    = [module.vpc.http_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "web1"
  tag_type  = "web"
  tag_env   = "geen"
}


module "ec2-web2" {
  source = ".//modules/ec2"
  ami_id    = data.aws_ami.ama2.id
  subnet_id = module.vpc.private_subnet_blue_id
  sg_ids    = [module.vpc.http_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "web2"
  tag_type  = "web"
  tag_env   = "blue"

}


module "ec2-php1" {
  source = ".//modules/ec2"
  ami_id    = data.aws_ami.ama2.id
  subnet_id = module.vpc.private_subnet_green_id
  sg_ids    = [module.vpc.http_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "php1"
  tag_type  = "php"
  tag_env   = "geen"

}

module "ec2-php2" {
  source = ".//modules/ec2"
  ami_id    = data.aws_ami.ama2.id
  subnet_id = module.vpc.private_subnet_blue_id
  sg_ids    = [module.vpc.http_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "php2"
  tag_type  = "php"
  tag_env   = "blue"

}

module "ec2-db" {
  source = ".//modules/ec2"
  ami_id    = data.aws_ami.ama2.id
  subnet_id = module.vpc.private_subnet_db_id
  sg_ids    = [module.vpc.db_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "db1"
  tag_type  = "db"
  tag_env   = "share"
}