resource "azurerm_subnet" "main" {
  for_each = { for subnet in subnets : subnet.name => subnet.cidr }

  name                 = each.key
  resource_group_name  = var.resource_group_name
  location             = var.resource_group_name
  virtual_network_name = var.vnet_name

  address_prefixes = [each.value]
}