terraform{
    backend "azurerm"{
        resource_group_name = "Cloud-DevOps-Training"
        storage_account_name= "cloudconfigbackend"
        container_name= "tfstate" 
        key="windows_server/terraform.tfstate"
    }
    required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "=2.78.0"
      }
    }
}