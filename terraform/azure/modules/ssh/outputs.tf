output "key_data" {
  description = "The public key data"
  value = azapi_resource_action.ssh_public_key_gen.output.publicKey
  sensitive = true
}
