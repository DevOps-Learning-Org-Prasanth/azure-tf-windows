variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}

variable "location" {
  type        = string
  description = "location where resources should be created"
}

variable "subnets" {
  type = list(object({
    name = string
    cidr = string
  }))
  description = "Address space and name for a subnet"
}

variable "vnet_name" {
  type        = string
  description = "Name of virtual network"
}