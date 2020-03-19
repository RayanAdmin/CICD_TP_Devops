# VPC
resource "aws_vpc" "vpc" {

  cidr_block           = var.network_address
  enable_dns_support   = var.dns_support
  enable_dns_hostnames = var.dns_hostnames
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name = var.name_vpc
  }
}
