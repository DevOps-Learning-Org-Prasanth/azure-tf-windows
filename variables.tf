variable "location" {
  type        = string
  description = "location where resources should be created"
}

variable "vnet_space" {
  type = object({
    name          = string
    address_space = string
  })
  description = "Address space of virtual network"
}

variable "subnet_space" {
  type = object({
    name           = string
    address_prefix = string
  })
  description = "Address space and name for a subnet"
}

variable "username" {
    type = string
    description = "username of vm"
    sensitive = true
}

variable "password" {
    type = string
    description = "password of vm"
    sensitive = true
}