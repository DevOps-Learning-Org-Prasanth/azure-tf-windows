terraform {
  required_version = "=1.6.4"
  backend "azurerm" {
    resource_group_name  = "Cloud-DevOps-Training"
    storage_account_name = "cloudconfigbackend"
    container_name       = "tfstate"
    key                  = "windows_server/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.88.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "5efa86ae-29bc-4760-a1db-51bde40f2fad"
  skip_provider_registration = true
  features {}
}
