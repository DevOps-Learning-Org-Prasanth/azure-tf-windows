variable "location" {
    type = "string"
    description = "location where resources should be created"
}

variable "vnet_space"{
    type = object({
        name = string
        address_space = string
    })
    description = "Address space of virtual network"
}

variable "subnet_space" {
    type = list(object({
        name = string
        address_space = string
    }))
    description = "Address space and name for a subnet"
}