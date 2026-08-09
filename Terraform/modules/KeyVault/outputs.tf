output "key_vault_name" {
  description = "The name of the key vault"
  value = data.azurerm_key_vault.kv.name
}