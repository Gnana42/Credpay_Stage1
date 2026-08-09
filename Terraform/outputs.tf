output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_id" {
  value = module.Networking.vnet_id
}

output "aks_cluster_name" {
  value = module.AKS.cluster_name
}

output "aks_resource_group" {
  value = module.resource_group.name
}

output "aks-kubelet_identity_object_id" {
  value = module.AKS.kubelet_identity_object_id
}

output "aks_oidc_issuer_url" {
  value = module.AKS.oidc_issuer_url
}

output "aks_node_resource_group" {
  value = module.AKS.node_resource_group
}

output "get_credentials_command" {
  value = "az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.AKS.cluster_name} --overwrite-existing"
}

output "postgres_server_name" {
  value = module.Postgres.server_name
}

output "postgres_fqdn" {
  value = module.Postgres.fqdn
}

output "postgres_database_name" {
  value = module.Postgres.database_name
}

output "postgres_admin_username" {
  value = module.Postgres.admin_username
}

output "postgres_admin_password" {
  value     = module.Postgres.admin_password
  sensitive = true
}

output "log_analytics_workspace_id" {
  value = module.Monitoring.workspace_id
}

output "key_vault_name" {
  value = module.KeyVault.key_vault_name
}