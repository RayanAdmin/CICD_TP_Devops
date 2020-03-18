
output "aws_vpc_arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.vpc.arn
}



output "aws_vpc_id" {
  description = "Name (id) of the VPC"
  value       = aws_vpc.vpc.id
}
