locals {
  name_prefix = "credpay"
  tags = {
    project    = "credpay"
    managed_by = "terraform"
  }
}

module "resource_group" {
  source   = "./modules/ResourceGroup"
  name     = "${local.name_prefix}-rg"
  location = "canadacentral"
  tags     = local.tags
}

module "Networking" {
  source                 = "./modules/Networking"
  name_prefix            = local.name_prefix
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.name
  vnet_address_space     = var.vnet_address_space
  aks_subnet_prefix      = var.aks_subnet_prefix
  postgres_subnet_prefix = var.postgres_subnet_prefix
  tags                   = local.tags
}

module "Monitoring" {
  source              = "./modules/Monitoring"
  name_prefix         = local.name_prefix
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  log_retention_days  = var.log_retention_days
  tags                = local.tags
}

module "Postgres" {
  source              = "./modules/Postgres"
  name_prefix         = local.name_prefix
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  admin_username      = var.postgres_admin_username
  postgres_version    = var.postgres_version
  database_name       = var.database_name
  tags                = local.tags
}

module "AKS" {
  source                     = "./modules/AKS"
  name_prefix                = local.name_prefix
  location                   = module.resource_group.location
  resource_group_name        = module.resource_group.name
  node_count                 = var.node_count
  min_node_count             = var.min_node_count
  max_node_count             = var.max_node_count
  vm_size                    = var.vm_size
  log_analytics_workspace_id = module.Monitoring.workspace_id
  aks_subnet_id              = module.Networking.subnet_ids["aks"]
  tags                       = local.tags
}

module "KeyVault" {
  source                        = "./modules/KeyVault"
  key_vault_name                = var.key_vault_name
  key_vault_resource_group_name = var.key_vault_resource_group_name
  postgres_fqdn                 = module.Postgres.fqdn
  postgres_database_name        = module.Postgres.database_name
  postgres_admin_username       = module.Postgres.admin_username
  postgres_admin_password       = module.Postgres.admin_password
}