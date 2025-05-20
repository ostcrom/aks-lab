variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string
}

variable "azure_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

variable "custom_domain" {
  description = "The custom domain to use for DNS records"
  type        = string
}

variable "ingress_ip" {
  description = "The public IP address of the ingress controller"
  type        = string
}