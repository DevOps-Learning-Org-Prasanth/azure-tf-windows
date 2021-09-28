# vnet

resource "azurerm_virtual_network" "main" {
  for_each            = { for subnet in var.subnet_space : subnet.name => subnet.address_prefix }
  name                = var.vnet_space.name
  resource_group_name = var.resource_group_name
  location            = var.location

  address_space = [var.vnet_space.address_space]

  subnet {
    name           = each.key
    address_prefix = each.value
  }
}