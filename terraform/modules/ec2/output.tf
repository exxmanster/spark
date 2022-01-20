output "instance" {
  description = "The instance"
  value       = aws_instance.DP4[*].id
}
output "private_ip" {
  description = "private ip"
  value       = aws_instance.DP4[*].private_ip
}



