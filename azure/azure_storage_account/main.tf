# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "3.56.0"
#     }
#   }
# }

provider "azurerm" {
  features {}
  # Configuration options
}

resource "azurerm_resource_group" "cloudavail_test_storage_resource_group" {
  name     = "cloudavail-test-storage"
  location = "East US"
}

resource "azurerm_storage_account" "cloudavail_test_storage_account" {
  name                     = "cloudavailtest"
  resource_group_name      = azurerm_resource_group.cloudavail_test_storage_resource_group.name
  location                 = azurerm_resource_group.cloudavail_test_storage_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  # access_tier = "Cool"
  # allow_nested_items_to_be_public = false
  # shared_access_key_enabled = false

}
