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
  value       = module.create_vpc.aws_route_table
}

for (i = 1; i < 4; i++) {
output "aws_subnet_subnet_public_${i}" {
  description = "Name (id) of the VPC"
  value       = module.create_snetwork.${i}.id
 }
}

for (i = 4; i < 7; i++) {
output "aws_subnet_subnet_private_${i}" {
  description = "Name (id) of the VPC"
  value       = module.create_snetwork.${i}.id
 }
}
