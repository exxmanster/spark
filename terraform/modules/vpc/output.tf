output "vpc_id"{
    value = aws_vpc.main.id
}

output "public_subnet_green_id" {
  description = "first public subnet id"
  value       = aws_subnet.public_green.id
}

output "public_subnet_blue_id" {
  description = "second public subnet id"
  value       = aws_subnet.public_blue.id
}


output "private_subnet_green_id" {
  description = "first private subnet id"
  value       = aws_subnet.private_green.id
}


output "private_subnet_blue_id" {
  description = "second private subnet id"
  value       = aws_subnet.private_blue.id
}

output "private_subnet_db_id" {
  description = "DB private subnet id"
  value       = aws_subnet.db_privat_subnet.id
}

output "ssh_sg" {
    description = "SSH SG id"
    value = aws_security_group.allow_ssh.id
}
output "http_sg" {
    description = "HTTP SG id"
    value = aws_security_group.allow_http.id
  
}

output "db_sg" {
    description = "DB SG id"
    value = aws_security_group.allow_db.id
  
}