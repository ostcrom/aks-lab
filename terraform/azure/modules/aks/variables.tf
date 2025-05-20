variable "location" {
  description = "The Azure region to deploy resources into"
  type        = string
}

variable "azure_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "pet_name" {
  description = "Pet name used for this deployment."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy nodes into"
  type        = string
}

variable "ssh_key_data" {
  description = "The SSH public key data for cluster admin access"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "username" {
  description = "The admin username for the cluster nodes"
  type        = string
  default     = "azureuser"
}

locals {
  node_rg = format("%s-node-rg", var.pet_name)
}
