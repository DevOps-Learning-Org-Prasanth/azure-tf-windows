# public ip
resource "azurerm_public_ip" "main" {
  name                = "bastion-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location

  allocation_method = "Static"
  sku               = "Standard"
}
# bastion host

resource "azurerm_bastion_host" "main" {
  name                = "windows_vnet_bastion"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                 = "bastion"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.main.ip
  }
}