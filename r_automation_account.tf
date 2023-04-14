###################################################################################################################
# How to create a automation account
# Reference - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account
###################################################################################################################
resource "azurerm_automation_account" "this" {
  name                = var.aa_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = "Basic"

  identity {
    type = "SystemAssigned"
  }

  tags = var.default_tags
}
