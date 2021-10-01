resource "azurerm_public_ip" "main" {
  name = "public-ip"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
}

resource "azurerm_network_interface" "main" {
  name                = local.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.subnet_cidr, 5)
    primary = true
  }
  ip_configuration {
    name = "publicip"
    public_ip_address_id = azurerm_public_ip.main.id
  }
}

resource "azurerm_windows_virtual_machine" "main" {
  name                = local.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_F2"
  admin_username      = var.username
  admin_password      = var.password

  network_interface_ids = [azurerm_network_interface.main.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}