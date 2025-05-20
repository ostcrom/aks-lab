variable "phase2" {
  description = "Enable phase 2 of the lab"
  type        = bool
  default     = false
}

variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "The environment name (e.g., dev, test, prod)."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "aks-lab"
}

variable "owner" {
  description = "Owner of the resources."
  type        = string
  default     = "your_name"
}

##Azure Service Principal details
variable "azure_client_id" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
}	

variable "azure_client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "custom_domain" {
  description = "The custom domain to use for DNS records"
  type        = string
}

variable "ingress_ip" {
  description = "The public IP address of the ingress controller"
  type        = string
  default     = ""
}

locals {
  tags = {
    Environment = var.environment
    Project     = var.project_name
    Owner       = var.owner
    CreatedBy   = "Terraform"
    CreatedOn   = formatdate("YYYY-MM-DD", timestamp())
  }
}
