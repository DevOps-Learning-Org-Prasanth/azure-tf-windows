# vnet

resource "azurerm_virtual_network" "main" {
    for_each = {for subnet in var.subnet_space: name => address_prefix}
    name = var.vnet.addr_space[name]
    resource_group_name = var.resource_group_name
    location = var.location

    address_space = [var.vnet_space[address_space]]
    
    subnets {
        name = each.value.name
        address_prefix = each.value.address_prefix
    }
}