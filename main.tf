module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location           = var.location
}

module "storage_account" {
  source                     = "./modules/storage_account"
  storage_account_name       = var.storage_account_name
  resource_group_name        = module.resource_group.resource_group_name
  location                  = module.resource_group.resource_group_location
  account_tier              = var.account_tier
  account_replication_type   = var.account_replication_type
  account_kind              = var.account_kind
  virtual_network_subnet_id  = var.virtual_network_subnet_id
  access_tier               = var.access_tier
  bypass                    = var.bypass
  public_network_access_enabled = var.public_network_access_enabled
  tfe_hostname              = var.tfe_hostname
  enable_threat_protection  = var.enable_threat_protection
  tags                      = var.tags
}

module "app_service_plan" {
  source                = "./modules/app_service_plan"
  app_service_plan_name = var.app_service_plan_name
  app_service_plan_tier = var.app_service_plan_tier
  app_service_plan_size = var.app_service_plan_size
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
}

module "app_service" {
  source                = "./modules/app_service"
  app_service_name      = var.app_service_name
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
  app_service_plan_id   = module.app_service_plan.app_service_plan_id
}

module "cosmosdb" {
  source                = "./modules/cosmosdb"
  cosmosdb_account_name = var.cosmosdb_account_name
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
  tags                  = var.tags
}

module "redis_cache" {
  source              = "./modules/redis_cache"
  redis_cache_name    = var.redis_cache_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  tags                = var.tags
}

module "vnet" {
  source                = "./modules/vnet"
  vnet_name             = var.vnet_name
  address_space         = var.address_space
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
}

module "private_endpoint_storage" {
  source      = "./modules/private_endpoint"
  name        = "storage-pe"
  resource_group_name = module.resource_group.resource_group_name
  location    = module.resource_group.resource_group_location
  subnet_id   = module.vnet.subnet_id
  private_service_connection = {
    name                           = "storage-psc"
    is_manual_connection           = false
    private_connection_resource_id = module.storage_account.storage_account_id
    subresource_names              = ["blob"]
  }
  tags        = var.tags
}

module "private_endpoint_cosmosdb" {
  source      = "./modules/private_endpoint"
  name        = "cosmosdb-pe"
  resource_group_name = module.resource_group.resource_group_name
  location    = module.resource_group.resource_group_location
  subnet_id   = module.vnet.subnet_id
  private_service_connection = {
    name                           = "cosmosdb-psc"
    is_manual_connection           = false
    private_connection_resource_id = module.cosmosdb.cosmosdb_account_id
    subresource_names              = ["MongoDB"]
  }
  tags        = var.tags
}

module "private_endpoint_redis" {
  source      = "./modules/private_endpoint"
  name        = "redis-pe"
  resource_group_name = module.resource_group.resource_group_name
  location    = module.resource_group.resource_group_location
  subnet_id   = module.vnet.subnet_id
  private_service_connection = {
    name                           = "redis-psc"
    is_manual_connection           = false
    private_connection_resource_id = module.redis_cache.redis_cache_id
    subresource_names              = ["redisCache"]
  }
  tags        = var.tags
}

module "private_endpoint_appservice" {
  source      = "./modules/private_endpoint"
  name        = "appservice-pe"
  resource_group_name = module.resource_group.resource_group_name
  location    = module.resource_group.resource_group_location
  subnet_id   = module.vnet.subnet_id
  private_service_connection = {
    name                           = "appservice-psc"
    is_manual_connection           = false
    private_connection_resource_id = module.app_service.app_service_id
    subresource_names              = ["sites"]
  }
  tags        = var.tags
}

module "network_security_group" {
  source              = "./modules/network_security_group"
  nsg_name            = var.nsg_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  subnet_id           = module.vnet.subnet_id
  tags                = var.tags
}

