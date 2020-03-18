# VPC
resource "aws_vpc" "vpc" {

  cidr_block           = var.network_address
  enable_dns_support   = var.dns_support
  enable_dns_hostnames = var.dns_hostnames
  enable_classiclink   = false
  instance_tenancy     = default

  tags = {
    Name = var.name_vpc
  }
}


output "aws_vpc.vpc.id" {
  description = "ARN of the VPC"
  value       = aws_vpc.vpc.arn
}



output "aws_vpc.vpc.id" {
  description = "Name (id) of the VPC"
  value       = aws_vpc.vpc.id
}
