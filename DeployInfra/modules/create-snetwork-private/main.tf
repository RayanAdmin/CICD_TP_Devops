#Subnet

resource "aws_subnet" var.subnet_name {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = "false"
  availability_zone       = var.availability_zone
  tags = {
    Name = var.tags
  }
}
