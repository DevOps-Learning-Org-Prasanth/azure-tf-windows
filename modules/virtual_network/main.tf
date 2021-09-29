# vnet

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_space.name
  resource_group_name = var.resource_group_name
  location            = var.location

  address_space = [var.vnet_space.address_space]
}