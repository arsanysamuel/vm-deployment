output "network_interface_id" {
  value = azurerm_network_interface.default.id
}

output "public_ip_name" {
  value = azurerm_public_ip.default.name
}

output "public_ip_address" {
  value = azurerm_public_ip.default.ip_address
}
