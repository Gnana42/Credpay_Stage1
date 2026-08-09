variable "name_prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}

variable "resource_group_name" {
  type = string
}

variable "vnet_address_space" {
  type = string
}

variable "aks_subnet_prefix" {
  type = string
}

variable "postgres_subnet_prefix" {
  type = string
}