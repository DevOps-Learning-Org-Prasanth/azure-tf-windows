variable "location" {
  type        = string
  description = "Location where resource should be created"
}

variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}

variable "subnet" {
  type = object({
    name = string
    cidr = string
  })
  description = "subnet details created in network module"
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