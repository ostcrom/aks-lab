resource "random_pet" "pet_name" {
  prefix = "k8s-lab"
}

resource "random_string" "storage_string" {
  length  = 12
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = format("%s-rg", random_pet.pet_name.id)
}
