module "ec2-db" {
  source = ".//modules/ec2"

  subnet_id = module.vpc.private_subnet_db_id
  sg_ids    = [module.vpc.db_sg, module.vpc.ssh_sg]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "db1"
  tag_type  = "db"
  tag_env   = "share"
}