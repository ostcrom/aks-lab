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
