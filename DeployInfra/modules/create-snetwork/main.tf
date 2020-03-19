
# Subnets
## Public
### AZ1
resource "aws_subnet" "subnet-public-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-3a"
  tags = {
    Name = "${var.env}-subnet-public-1"
  }
}

### AZ2
resource "aws_subnet" "subnet-public-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-3b"
  tags = {
    Name = "${var.env}-subnet-public-2"
  }
}

### AZ3
resource "aws_subnet" "subnet-public-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-3c"
  tags = {
    Name = "${var.env}-subnet-public-3"
  }
}

## Private
### AZ1
resource "aws_subnet" "subnet-private-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-3a"
  tags = {
    Name = "${var.env}-subnet-private-1"
  }
}

### AZ2
resource "aws_subnet" "subnet-private-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-3b"
  tags = {
    Name = "${var.env}-subnet-private-2"
  }
}

### AZ3
resource "aws_subnet" "subnet-private-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-3c"
  tags = {
    Name = "${var.env}-subnet-private-3"
  }
}
