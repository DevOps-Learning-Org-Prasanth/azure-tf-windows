resource "azurerm_resource_group" "main" {
  name     = "Windows-Server-PG"
  location = var.location
}

module "virtual_network" {
  source              = "./modules/virtual_network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_space = var.vnet_space
}

module "network_subnet" {
  source              = "./modules/network_subnet"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_name = var.vnet_space.name
  subnets   = var.subnets
  depends_on = [
    module.virtual_network
  ]
}

module "windows" {
  source              = "./modules/windows_server"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  username = var.username
  password = var.password

  subnet_id   = module.network_subnet.subnets["win_server"].id
  subnet_cidr = module.network_subnet.subnets["win_server"].cidr

  depends_on = [
    module.network_subnet
  ]
}

# module "bastion" {
# source              = "./modules/bastion"
# resource_group_name = azurerm_resource_group.main.name
# location            = azurerm_resource_group.main.location
# 
# subnet_id = module.network_subnet.subnets["AzureBastionSubnet"].id
# 
# depends_on = [
# module.network_subnet, module.windows
# ]
# }
