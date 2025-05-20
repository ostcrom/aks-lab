output "kubernetes_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.k8s.name
}

output "host" {
  description = "The Kubernetes cluster server host"
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.host
  sensitive   = true
}

output "client_certificate" {
  description = "The Kubernetes cluster client certificate"
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "The Kubernetes cluster client key"
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The Kubernetes cluster CA certificate"
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "kube_config_raw" {
  description = "Raw Kubernetes config"
  value       = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive   = true
}

output "kube_config" {
  description = "Kubernetes config"
  value       = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive   = true
}

output "node_resource_group" {
  description = "The auto-generated resource group which contains the resources for this managed Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.k8s.node_resource_group
}

output "kubelet_identity" {
  description = "The Managed Identity for the Kubelet"
  value       = azurerm_kubernetes_cluster.k8s.kubelet_identity
}
