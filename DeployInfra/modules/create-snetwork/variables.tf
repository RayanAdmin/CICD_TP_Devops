variable "network_address" {
  description = "Adresse du Reseau (format CICR)"
  type = string
}

variable "dns_support" {
  description = "activer DNS Support"
  type = string
}

variable "dns_hostnames" {
  description = "activer resolution DNS"
  type = string
}

variable "name_vpc" {
  description = "nom du vpc"
  type = string
}
