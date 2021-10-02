resource "azurerm_network_security_group" "main" {
  name = "Windows-VM-NSG"
  resource_group_name = var.resource_group_name
  location = var.location
}

resource "azurerm_network_security_rule" "allow_rdp" {
  name = "Allow RDP inbound"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.main.name
  
  priority = 101
  direction = "Inbound"
  access = "Allow"
  protocol  = "*"
  source_address_prefix = "*"
  source_port_range = "3389"
  destination_address_prefix = "*"
  destination_port_range = "3389"
} 

resource "azurerm_network_security_rule" "allow_rdp_outbound" {
  name = "Allow RDP inbound"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.main.name
  
  priority = 101
  direction = "Outbound"
  access = "Allow"
  protocol  = "*"
  source_address_prefix = "*"
  source_port_range = "3389"
  destination_address_prefix = "*"
  destination_port_range = "3389"
}

resource "azurerm_subnet_network_security_group_association" "main" {
  network_security_group_id = azurerm_network_security_group.main.id
  subnet_id = var.subnet_id
}