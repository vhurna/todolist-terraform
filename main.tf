terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "mate-azure-task-12"
  location = var.location
}

module "network" {
  source                      = "./modules/network"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.this.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "storage" {
  source               = "./modules/storage"
  location             = var.location
  resource_group_name  = azurerm_resource_group.this.name
  storage_account_name = var.storage_account_name
  storage_container    = var.storage_container
}

module "compute" {
  source               = "./modules/compute"
  location             = var.location
  resource_group_name  = azurerm_resource_group.this.name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  ssh_key_public       = var.ssh_key_public
  subnet_id            = module.network.subnet_id
  public_ip_id         = module.network.public_ip_id
  public_ip_address    = module.network.public_ip_address
  storage_account_name = module.storage.storage_account_name
  storage_container    = module.storage.storage_container_name
  storage_account_primary_blob_endpoint = module.storage.blob_endpoint
}
