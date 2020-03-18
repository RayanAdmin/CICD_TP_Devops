
output "arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.vpc.arn
}



output "id" {
  description = "Name (id) of the VPC"
  value       = aws_vpc.vpc.id
}
