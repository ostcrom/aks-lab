output "resource_group_name" {
  description = "The name of the resource group"
  value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value = azurerm_resource_group.rg.id
}

output "resource_group_location" {
  description = "The location of the resource group"
  value = azurerm_resource_group.rg.location
}

output "pet_name" {
  description = "The generated pet name for this deployment."
  value = random_pet.pet_name.id
}

output "storage_string" {
  description = "Random string used to name the storage account."
  value = random_string.storage_string.result
}
