output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vm_name" {
  value = module.virtual_machine.vm_name
}

output "vm_public_ip_name" {
  value = module.virtual_network.public_ip_name
}

output "vm_public_ip_address" {
  value = module.virtual_machine.vm_public_ip_address
}
