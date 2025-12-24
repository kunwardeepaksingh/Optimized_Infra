terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "deepakrg"
    storage_account_name = "deepakstg"
    container_name = "deepcont"
    key = "terraform.tfstate"
  }
}
provider "azurerm" {
    features {}
    subscription_id = "98473d5b-c639-404e-9bf2-91559fe65ff8"
  # Configuration options
}