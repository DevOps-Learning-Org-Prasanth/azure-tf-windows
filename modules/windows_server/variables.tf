variable "location" {
  type        = string
  description = "Location where resource should be created"
}

variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}

variable "subnet_id" {
  type        = string
  description = "id of the subnet created for this server"
}

variable "subnet_cidr" {
  type        = string
  description = "cidr of subnet created"
}

variable "username" {
  type        = string
  description = "username of vm"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "password of vm"
  sensitive   = true
}
