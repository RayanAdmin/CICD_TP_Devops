variable "subnet_name" {
  description = "subnet_name"
  type = string
}

variable "vpc_id" {
  description = "vpc_id"
  type = string
}

variable "cidr_block" {
  description = "activer resolution DNS"
  type = string
}

variable "availability_zone" {
  description = "availability_zone"
  type = string
}


variable "tags" {
  description = "availability_zone"
  type = map(string)
  default = {}
}

