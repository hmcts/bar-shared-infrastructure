resource "azurerm_application_insights" "appinsights" {
  name                = join("-", [var.product, var.env])
  location            = var.appinsights_location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = var.application_type

  lifecycle {
      ignore_changes = [
        # Ignore changes to appinsights as otherwise upgrading to the Azure provider 2.x
        # destroys and re-creates this appinsights instance
        application_type,
      ]
    }
}

module "application_insights" {
  source = "git@github.com:hmcts/terraform-module-application-insights?ref=main"

  env     = var.env
  product = var.product
  name    = "${var.product}"

  resource_group_name = azurerm_resource_group.rg.name

  common_tags = var.common_tags
}

moved {
  from = azurerm_application_insights.appinsights
  to   = module.application_insights.azurerm_application_insights.this
}

# output "appInsightsInstrumentationKey" {
#   value = "${azurerm_application_insights.appinsights.instrumentation_key}"
# }
