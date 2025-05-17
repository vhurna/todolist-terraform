variable "location" {
  default = "uksouth"
}
variable "resource_group_name" {
  default = "mate-azure-task-12"
}
variable "virtual_network_name" {
  default = "vnet"
}
variable "vnet_address_prefix" {
  default = "10.0.0.0/16"
}
variable "subnet_name" {
  default = "default"
}
variable "subnet_address_prefix" {
  default = "10.0.0.0/24"
}
variable "network_security_group_name" {
  default = "defaultnsg"
}
variable "public_ip_address_name" {
  default = "linuxboxpip"
}
variable "dns_label" {}
variable "storage_account_name" {}
variable "storage_container" {
  default = "task-artifacts"
}
variable "vm_name" {
  default = "matebox"
}
variable "vm_size" {
  default = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "Public SSH key to use for VM login"
}

variable "backend_storage_account" {
  description = "Storage account для remote state"
}

variable "backend_container" {
  description = "Container для remote state"
}
