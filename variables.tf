variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "example-resource-group"
}

variable "storage_account_name" {
  description = "Globally unique name of the Storage Account (lowercase only)"
  type        = string
  default     = "examplestoracct2025"
}
variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
}
variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
  default     = "Standard"
}
variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}
variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
}
variable "account_kind" {
  description = "The kind of storage account"
  type        = string
  default     = "StorageV2"
}
variable "virtual_network_subnet_id" {
  description = "The ID of the Virtual Network Subnet to associate with the Storage Account"
  type        = string
  default     = null
}
variable "access_tier" {
  description = "The access tier for the storage account"
  type        = string
  default     = "Hot"
}
variable "bypass" {
  description = "The bypass settings for the storage account"
  type        = list(string)
  default     = ["AzureServices"]
}
variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the storage account"
  type        = bool
  default     = true
}
variable "tfe_hostname" {
  description = "The hostname for Terraform Enterprise"
  type        = string
  default     = null
}
variable "enable_threat_protection" {
  description = "Enable threat protection for the storage account"
  type        = bool
  default     = false
}
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {
    environment = "demo"
  }
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "example-appservice-plan"
}

variable "app_service_plan_tier" {
  description = "Tier for the App Service Plan (e.g., Standard, Basic)"
  type        = string
  default     = "Standard"
}

variable "app_service_plan_size" {
  description = "Size for the App Service Plan (e.g., S1, B1)"
  type        = string
  default     = "S1"
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
  default     = "example-appservice"
}

variable "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account. Must be globally unique."
  type        = string
}

variable "redis_cache_name" {
  description = "The name of the Redis Cache instance. Must be globally unique."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "The address space for the Virtual Network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet."
  type        = string
}

variable "nsg_name" {
  description = "The name of the Network Security Group."
  type        = string
}

