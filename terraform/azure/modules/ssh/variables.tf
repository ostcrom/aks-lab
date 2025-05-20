variable "location" {
  description = "The Azure region to deploy resources into"
  type        = string
  default     = "southcentralus"
}

variable "resource_group_id" {
  description = "The ID of the resource group"
  type        = string
}

variable "pet_name" {
  description = "Pet name used for this deployment."
  type        = string
  default     = "chuckecheese"
}
