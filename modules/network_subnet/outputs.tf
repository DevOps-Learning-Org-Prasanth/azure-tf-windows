output "subnet" {
  value = { for subnet in var.subnets :
    (subnet.name) => {
      subnet_id   = azurerm_subnet.main[subnet.name],
      subnet_cidr = subnet.cidr
    }
  }

  description = "Returns an object which contains the subnet details"
}