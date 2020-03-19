
output "arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.vpc.arn
}



output "aws_vpc_id" {
  description = "Name (id) of the VPC"
  value       = aws_vpc.vpc.id
}


output "id" {
  description = "Name (id) of the VPC"
  value       = aws_vpc.vpc.id
}


output "aws_route_table" {
  description = "Route-table of the VPC"
  value       = aws_vpc.vpc.default_route_table_id
}



output "default_route_table_id" {
  description = "Route-table of the VPC"
  value       = aws_vpc.vpc.default_route_table_id
}
