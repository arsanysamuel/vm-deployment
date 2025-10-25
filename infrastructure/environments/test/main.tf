terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.50.0, < 5.0.0"
    }
  }

  required_version = ">= 1.13.0"

  # TODO: remote state backend to be added
  # https://developer.hashicorp.com/terraform/language/backend/azurerm
}

provider "azurerm" {
  resource_provider_registrations = "core"
  subscription_id                 = var.azure_subscription_id
  features {}
}

module "resource_group" {
  source = "../../modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.azure_location
}

module "virtual_network" {
  source = "../../modules/virtual-network"

  location            = var.azure_location
  resource_group_name = module.resource_group.resource_group_name
}

module "virtual_machine" {
  source = "../../modules/virtual-machine"

  location             = var.azure_location
  resource_group_name  = module.resource_group.resource_group_name
  network_interface_id = module.virtual_network.network_interface_id
}
