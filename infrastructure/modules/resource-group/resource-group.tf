terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.50.0, < 5.0.0"
    }
  }
}

resource "azurerm_resource_group" "coca_cola" {
  name     = var.resource_group_name
  location = var.location
}
