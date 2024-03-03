locals {
  location_code = {
    northcentralus : "nua01",
    southcentralus : "sua01",
    eastus : "eua1"
    westeurope : "wea01"
  }

  nic_name = "${local.location_code[var.location]}-per-nic0"
  vm_name  = "${local.location_code[var.location]}-per-vm0"

  install_script = "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));choco install firefox --confirm"
}