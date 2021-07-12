provider "azurerm" {
  features {}
}
variable "location" {
  default = "japaneast"
}
resource "azurerm_resource_group" "example" {
  name     = "rg-armtemplate"
  location = var.location
}

resource "random_string" "uniqstr" {
  length  = 6
  special = false
  upper   = false
  keepers = {
    resource_group_name = azurerm_resource_group.example.name
  }
}

resource "azurerm_storage_account" "example" {
  resource_group_name      = azurerm_resource_group.example.name
  name                     = "store${random_string.uniqstr.id}"
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
}
resource "azurerm_storage_container" "example" {
  name                  = "container"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
output "storageaccount_endpoint" {
  value = azurerm_storage_account.example.primary_blob_endpoint
}
