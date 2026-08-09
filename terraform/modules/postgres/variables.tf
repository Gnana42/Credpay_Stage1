variable "name_prefix" {
  description = "Prefix for the resource names"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL server."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the PostgreSQL server."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the PostgreSQL server."
  type        = string
}

variable "database_name" {
  description = "The name of the PostgreSQL database to create."
  type        = string
}

variable "postgres_version" {
  description = "The version of PostgreSQL to use for the server."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {
    environment = "dev"
  }
}