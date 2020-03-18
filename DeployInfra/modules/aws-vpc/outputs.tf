
output "arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.vpc.arn
}



output "id" {
  description = "Name (id) of the VPC"
  value       = aws_vpc.vpc.id
}




output "route_table" {
  description = "Route-table of the VPC"
  value       = aws_vpc.vpc.default_route_table_id
}
