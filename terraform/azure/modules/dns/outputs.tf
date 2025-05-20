output "dns_zone_name" {
  description = "The name of the DNS zone"
  value       = azurerm_dns_zone.domain.name
}

output "name_servers" {
  description = "The name servers for the DNS zone"
  value       = azurerm_dns_zone.domain.name_servers
}

output "dns_zone_id" {
  description = "The ID of the DNS zone"
  value       = azurerm_dns_zone.domain.id
}

output "apex_domain_fqdn" {
  description = "The FQDN of the apex domain record"
  value       = azurerm_dns_a_record.apex.fqdn
}

output "wildcard_domain_fqdn" {
  description = "The FQDN of the wildcard domain record"
  value       = azurerm_dns_a_record.wildcard.fqdn
}