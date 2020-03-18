output "aws_vpc_arn {
  description = "ARN of the VPC"
  value       = module.create_vpc.arn
}

output "aws_vpc_arn_id" {
  description = "Name (id) of the bucket"
  value       = module.create_vpc.name
}
