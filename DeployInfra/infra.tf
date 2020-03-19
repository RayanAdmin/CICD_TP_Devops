provider "aws" {
  region = "eu-west-3"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "az_valable" {
  description = "az-valable"
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}

variable "image" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  }

terraform {
  backend "s3" {
  }
}

module "create_vpc" {
  source = "./modules/aws-vpc"
  
  network_address = "10.0.0.0/16"
  dns_support = "true"
  dns_hostnames = "true"
  name_vpc = "${var.env}-vpc"
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = "${module.create_vpc.aws_vpc_id}"

  tags = {
    Name = "${var.env}-igw"
  }
}

# Subnets
## Public
### AZ1
  
for (i = 1; i < 4; i++) {  
  module "create-snetwork" {
    source = "./modules/create-snetwork"
    
    subnet_name = "subnet-public-.${i}"
    vpc_id                  = "${module.create_vpc.aws_vpc_id}"
    cidr_block              = "10.0.${i}.0/24"
    map_public_ip_on_launch = "true"
    availability_zone       = vars.az_valable[i+1]
    tags = {
    Name = "${var.env}-subnet-public-.${i}"
    }
    
  }
}
  
for (i = 4; i < 7; i++) {  
  module "create-snetwork" {
    source = "./modules/create-snetwork"
    
    subnet_name = "subnet-public-.${i}"
    vpc_id                  = "${module.create_vpc.aws_vpc_id}"
    cidr_block              = "10.0.${i}.0/24"
    map_public_ip_on_launch = "false"
    availability_zone       = vars.az_valable[i-4]
    tags = {
    Name = "${var.env}-subnet-private-.${i}"
    }
    
  }
}


# Nat Instance
resource "aws_instance" "nat" {
  ami                    = "${var.image}"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-public-1.id
  vpc_security_group_ids = [aws_security_group.allow_nat.id]
  source_dest_check      = "false"

  user_data = <<-EOF
        #!/bin/bash
        sysctl -w net.ipv4.ip_forward=1 /sbin/
        iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  EOF

  tags = {
    Name = "${var.env}-NatInstance"
  }
}

# Nat SG
resource "aws_security_group" "allow_nat" {
  name        = "allow_web"
  vpc_id      = "${module.create_vpc.aws_vpc_id}"
  description = "Allow inbound traffic"
}

## SG Rule egress
resource "aws_security_group_rule" "web_egress_allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_nat.id
}

## SG Rule ingress
resource "aws_security_group_rule" "ingress_allow_private" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  security_group_id = aws_security_group.allow_nat.id
}

# Route Table
## Private
### Use Main Route Table
resource "aws_default_route_table" "main-private" {
  default_route_table_id ="${module.create_vpc.default_route_table_id}" 

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.nat.id
  }

  tags = {
    Name = "${var.env}-rt-main-private"
  }
}

## Public
resource "aws_route_table" "public" {
  vpc_id = "${module.create_vpc.aws_vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-rt-public"
  }
}

# Public Route Table Association
resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.subnet-public-2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-3" {
  subnet_id      = aws_subnet.subnet-public-3.id
  route_table_id = aws_route_table.public.id
}
