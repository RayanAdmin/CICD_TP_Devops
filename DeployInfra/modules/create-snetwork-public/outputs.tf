output "arn" {
  description = "ARN of the VPC"
  value       = aws_subnet.${var.subnet_name}.arn
}



output "aws_subnet_id" {
  description = "Name (id) of the VPC"
  value       = aws_subnet.${var.subnet_name}.id
}


output "id" {
  description = "Name (id) of the VPC"
  value       = aws_subnet.${var.subnet_name}.id
}
