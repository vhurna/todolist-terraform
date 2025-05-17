output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "public_ip_id" {
  description = "ID of the public IP resource"
  value       = azurerm_public_ip.pip.id
}
