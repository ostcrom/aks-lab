output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.core.resource_group_name
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = module.aks.kubernetes_cluster_name
}

output "kubernetes_host" {
  description = "The Kubernetes cluster host"
  value       = module.aks.host
  sensitive   = true
}

output "client_certificate" {
  description = "The client certificate for authentication"
  value       = module.aks.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "The client key for authentication"
  value       = module.aks.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The cluster CA certificate"
  value       = module.aks.cluster_ca_certificate
  sensitive   = true
}

output "dns_zone_name" {
  description = "The DNS zone name"
  value       = var.phase2 ? module.dns[0].dns_zone_name : ""
}

output "dns_name_servers" {
  description = "The name servers for the DNS zone"
  value       = var.phase2 ? module.dns[0].name_servers : []
}

output "kube_config" {
  description = "The kubeconfig for the AKS cluster"
  value       = module.aks.kube_config 
  sensitive   = true
}
