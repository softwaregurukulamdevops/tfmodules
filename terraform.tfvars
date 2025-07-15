location              = "East US"
resource_group_name   = "evkt-demo-resource-group"
storage_account_name  = "evktstorageacct02"
subscription_id = "c3445c94-e383-4529-af5e-f575d47309bd"
tenant_id = "e1c5d9ee-a951-451e-8432-642c23d40071"
account_replication_type = "LRS"
account_tier = "Standard"
account_kind = "StorageV2"
virtual_network_subnet_id = null
access_tier = "Hot"
bypass = ["AzureServices"]
public_network_access_enabled = true
tfe_hostname = "tfe.example.com"
enable_threat_protection = true
app_service_plan_name = "evktexample-appservice-plan"
app_service_plan_tier = "Basic"
app_service_plan_size = "B1"
app_service_name = "evktexample-appservice"
cosmosdb_account_name = "evktexample-cosmosdb-mongo1"
tags = {
  environment = "demo"
}
redis_cache_name = "evktexample-redis-cache"
vnet_name = "evkt-vnet"
address_space = ["10.0.0.0/16"]
subnet_name = "evkt-subnet"
subnet_address_prefix = "10.0.1.0/24"
nsg_name = "evkt-nsg"

# Note: Ensure the storage account name is globally unique and follows Azure naming conventions:

