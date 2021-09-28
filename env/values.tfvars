location = "northcentralus"

vnet_space = {
    name: "windows_virtual_network",
    address_space: "10.255.44.0/24"
}

subnet_space = [
    {
        name: "subnet1",
        address_space: "10.255.44.0/28"
    }
]