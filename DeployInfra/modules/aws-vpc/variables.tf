variable "network_address" {
  description = "Adresse du Reseau (format CICR)"
  type = string
  default = {}
}

variable "dns_support" {
  description = "activer DNS Support"
  type = string
  default = {true}
}

variable "dns_hostnames" {
  description = "activer resolution DNS"
  type = string
  default = {true}
}

variable "name_vpc" {
  description = "nom du vpc"
  type = string
  default = {vpc}
}

