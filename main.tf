provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias                      = "private_endpoint"
  subscription_id            = var.aks_subscription_id
}

locals {
  ase_name = join("-", ["core-compute", var.env])

  common_tags = {
    team_name    = var.team_name
    team_contact = var.team_contact
  }
}

// Shared Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "bar-${var.env}-rg"
  location = var.location

  tags = {
    "Deployment Environment" = var.env
    "Team Name"              = var.team_name
    "Team Contact"           = var.team_contact
    "Destroy Me"             = var.destroy_me
    "fake1"                  = "fake1"
  }
}
