output "bastion_pub_ip" {
  description = "Bastion Public IP"
  value       = "${aws_instance.bastion.public_ip}"
}

output "ami" {
  description = "Ami image"
  value       = "${data.aws_ami.ama2.id}"
}

output "green_alb_url" {
  description = "ALB Green URL"
  value       = "${aws_alb.green.dns_name}"
}

output "blue_alb_url" {
  description = "ALB Blue URL"
  value       = "${aws_alb.blue.dns_name}"
}
