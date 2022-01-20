output "bastion_pub_ip" {
  description = "Bastion Public IP"
  value       = "${aws_instance.bastion.public_ip}"
}

output "ami" {
  description = "Ami image"
  value       = "${data.aws_ami.ama2.id}"
}

# output "web_ips" {
#   description = "Web IP's"
#   value       = "${module.ec2-web1.private_ip[0]}, ${module.ec2-web1.private_ip[0]}"

# }

# output "db_ips" {
#   description = "DBs IP's"
#   value       = "${module.ec2-db1.private_ip[0]}"
# }

#   output "priv_ip" {  
#   description = "private IPs"  
#   value       = <<EOT
# %{ for ip in aws_instance.web*.private_ip ~}
# ${aws_instance.web*.name} ${ip}
# %{ endfor ~}
# EOT
#   }
