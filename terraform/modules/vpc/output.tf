output "vpc_id"{
    value = aws_vpc.main.id
}

output "public_subnet1_id" {
  description = "first public subnet id"
  value       = aws_subnet.public1.id
}

output "public_subnet2_id" {
  description = "second public subnet id"
  value       = aws_subnet.public2.id
}


output "private_subnet1_id" {
  description = "first private subnet id"
  value       = aws_subnet.private1.id
}


output "private_subnet2_id" {
  description = "second private subnet id"
  value       = aws_subnet.private2.id
}
output "ssh_sg" {
    description = "SSH SG id"
    value = aws_security_group.allow_ssh.id
}
output "http_sg" {
    description = "HTTP SG id"
    value = aws_security_group.allow_http.id
  
}