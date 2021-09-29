locals {
  location_code = {
    northcentralus : "nua01",
    southcentralus : "sua01",
    westeurope : "wea01"
  }

  nic_name = "${location_code[var.location]}-per-nic0"
  vm_name  = "${location_code[var.location]}-per-vm0"
}