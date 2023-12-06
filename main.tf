# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "front_end_rg" {
  name     = "rg-frontend-sand-ne-001"
  location = "northeurope"
}

resource "azurerm_storage_account" "front_end_rg" {
  name                     = "simplestorage11111"
  resource_group_name      = azurerm_resource_group.front_end_rg.name
  location                 = azurerm_resource_group.front_end_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document   = "index.html"
  }
}