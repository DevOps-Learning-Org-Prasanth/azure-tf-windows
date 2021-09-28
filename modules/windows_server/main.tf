data "azurerm_subnet" "main" {
  name                = var.subnet.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "main" {
  name                = "sua1-per-nic0"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.subnet.cidr, 5)
  }
}

resource "azurerm_windows_virtual_machine" "main" {
  name                = "sua1-per-vm0"
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