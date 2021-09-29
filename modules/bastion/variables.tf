variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}

variable "location" {
  type        = string
  description = "location where resources should be created"
}

variable "subnet_id" {
  type        = string
  description = "id of subnet created for bastion"
}