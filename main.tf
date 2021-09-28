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
  source = "./modules/windows_server"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  subnet = {
    id = module.network.subnet_id
    cidr = var.subnet_space.address_prefix
  }
}