module "bar-vault" {
  source = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name = join("-", [var.product, var.env])
  product = var.product
  env = var.env
  tenant_id = var.tenant_id
  object_id = var.jenkins_AAD_objectId
  resource_group_name = azurerm_resource_group.rg.name
  # group id of dcd_reform_dev_azure
  product_group_object_id = "637c823a-d4d6-4cac-bb6c-dd8159309e0d"
  common_tags         = var.common_tags
  managed_identity_object_ids = ["${var.managed_identity_object_id}"]
  create_managed_identity = true
}

output "vaultName" {
  value = "${module.bar-vault.key_vault_name}"
}
