resource "azurerm_virtual_network" "app_vnet" {
  name = format("%s_%s", var.pet_name, "vnet")
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = ["10.4.0.0/16"]
  tags = var.azure_tags
}

resource "azurerm_subnet" "app_snet" {
  name = "app_snet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes = ["10.4.1.0/24"]
}
