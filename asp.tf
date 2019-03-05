module "appServicePlan" {
  source = "git@github.com:hmcts/cnp-module-app-service-plan?ref=master"
  location = "${var.location}"
  env = "${var.env}"
  resource_group_name = "bar-${var.env}-rg"
  asp_capacity = "${var.asp_capacity}"
  asp_name = "bar-asp"
  ase_name = "${local.ase_name}"
  tag_list = "${local.common_tags}"
  dummy="dummy"
}
