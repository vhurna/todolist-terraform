output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "storage_container_name" {
  value = azurerm_storage_container.container.name
}

output "blob_endpoint" {
  description = "Primary blob endpoint of the storage account"
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}
