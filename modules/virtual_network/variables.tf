variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}

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
