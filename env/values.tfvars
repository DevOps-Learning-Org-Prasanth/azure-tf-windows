location = "northcentralus"

vnet_space = {
  name : "windows_virtual_network",
  address_space : "10.255.44.0/24"
}

subnet_space = [
  {
    name : "subnet1",
    address_prefix : "10.255.44.0/28"
  },
  {
    name : "subnet2",
    adddress_prefix : "10.255.44.0/29"
  }
]