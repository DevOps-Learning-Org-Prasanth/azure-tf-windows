location = "northcentralus"

vnet_space = {
  name : "windows_virtual_network",
  address_space : "10.255.44.0/23"
}

subnets = [
  {
    name : "win_server",
    cidr : "10.255.44.0/24"
  },
  {
    name : "bastion"
    cidr : "10.255.45.0/24"
  }
]