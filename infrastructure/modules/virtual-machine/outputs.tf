output "vm_name" {
  value = azurerm_linux_virtual_machine.default.name
}

output "vm_public_ip_address" {
  value = azurerm_linux_virtual_machine.default.public_ip_address
}
