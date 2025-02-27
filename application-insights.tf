module "application_insights" {
  source = "git@github.com:hmcts/terraform-module-application-insights?ref=4.x"

  env     = var.env
  product = var.product
  name    = var.product

  resource_group_name = azurerm_resource_group.rg.name

  common_tags = var.common_tags

  location = var.appinsights_location
}

moved {
  from = azurerm_application_insights.appinsights
  to   = module.application_insights.azurerm_application_insights.this
}

# output "appInsightsInstrumentationKey" {
#   value = "${azurerm_application_insights.appinsights.instrumentation_key}"
# }
