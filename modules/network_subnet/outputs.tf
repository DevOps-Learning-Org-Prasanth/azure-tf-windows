output "subnets" {
  value = { for subnet in var.subnets :
    (subnet.name) => {
      id   = azurerm_subnet.main[subnet.name]
      cidr = subnet.cidr
    }
  }

  description = "Returns an object which contains the subnet details"
}