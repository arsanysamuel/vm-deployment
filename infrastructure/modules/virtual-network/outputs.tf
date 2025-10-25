output "network_interface_id" {
  value = azurerm_network_interface.default.id
}

output "public_ip" {
  value = azurerm_public_ip.default.ip_address
}
