
terraform {
  backend "azurerm" {}
  required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "~> 3.110.0"
        }
      }
}


data "terraform_remote_state" "core_apps_infrastructure" {
  backend = "azurerm"

  config = {
    resource_group_name  = join("-",["mgmt-state-store",var.subscription])
    storage_account_name = "mgmtstatestore${var.subscription}"
    container_name       = "mgmtstatestorecontainer${var.env}"
    key                  = "core-infra/${var.env}/terraform.tfstate"
  }
}

/* data "azurerm_subnet" "subnet_a" {
  name                 = "core-infra-subnet-0-${var.env}"
  virtual_network_name = "core-infra-vnet-${var.env}"
  resource_group_name  = "core-infra-${var.env}"
} */
#
# data "azurerm_subnet" "subnet_b" {
#   name                 = "app-gw-sb-${var.env}"
#   virtual_network_name = "core-infra-vnet-${var.env}"
#   resource_group_name  = "core-infra-${var.env}"
# }
