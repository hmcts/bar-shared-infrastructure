locals {
  sku_size = var.env == "prod" || var.env == "aat" ? "I2" : "I1"
}
/*module "appServicePlan" {
  source = "git@github.com:hmcts/cnp-module-app-service-plan?ref=master"
  location = "${var.location}"
  env = "${var.env}"
  resource_group_name = "bar-${var.env}-rg"
  asp_capacity = var.asp_capacity
  asp_sku_size = local.sku_size
  asp_name = "bar-asp"
  ase_name = local.ase_name
  tag_list = local.common_tags
}*/
