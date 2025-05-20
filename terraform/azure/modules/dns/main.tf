resource "azurerm_dns_zone" "domain" {
  name                = var.custom_domain
  resource_group_name = var.resource_group_name
  tags                = var.azure_tags
}

# Create an A record for the wildcard domain pointing to the ingress controller IP
resource "azurerm_dns_a_record" "wildcard" {
  name                = "*"
  zone_name           = azurerm_dns_zone.domain.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.ingress_ip]
}

# Create an A record for the apex domain pointing to the ingress controller IP
resource "azurerm_dns_a_record" "apex" {
  name                = "@"
  zone_name           = azurerm_dns_zone.domain.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.ingress_ip]
}