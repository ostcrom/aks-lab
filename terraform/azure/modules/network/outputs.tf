output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.app_vnet.name
}

output "virtual_network_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.app_vnet.id
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.app_snet.name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.app_snet.id
}