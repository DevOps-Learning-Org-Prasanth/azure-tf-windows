resource "azurerm_resource_group" "main" {
  name     = "Windows-Server-PG"
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_space   = var.vnet_space
  subnet_space = var.subnet_space
}

module "windows" {
  source              = "./modules/windows_server"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  username = var.username
  password = var.password

  subnet = {
    name = var.subnet_space.name
    cidr = var.subnet_space.address_prefix
  }
  vnet_name = var.vnet_space.name
  depends_on = [
    module.network
  ]
}