output "aws_vpc_arn" {
  description = "ARN of the VPC"
  value       = module.create_vpc.arn
}

output "aws_vpc_id" {
  description = "Name (id) of the VPC"
  value       = module.create_vpc.id
}

output "aws_route_table" {
  description = "Route-table of the VPC"
  value       = module.create_vpc.route_table
}
