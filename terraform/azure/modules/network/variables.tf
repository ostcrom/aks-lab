variable "location" {
  description = "The Azure region to deploy resources into"
  type        = string
  default     = "southcentralus"
}

variable "azure_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "terraform-azure"
  }
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-terraform-azure"
}

variable "pet_name" {
  description = "Pet name used for this deployment."
  type        = string
  default     = "chuckecheese"
}

locals {
  node_rg = format("%s-node-rg", var.pet_name)
}
