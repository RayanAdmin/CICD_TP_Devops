variable "subnet_name" {
  description = "Nom du subnet"
  type = string
}

variable "vpc_id" {
  description = "activer DNS Support"
  type = string
}

variable "cidr_block" {
  description = "cidr_block"
  type = string
}

variable "map_public_ip_on_launch" {
  description = "map_public_ip_on_launch"
  type = string
}

variable "availability_zone" {
  description = "map_public_ip_on_launch"
  type = string
}

variable "tags" {
  description = "tags"
  type = map(string)
  default = {}
}
