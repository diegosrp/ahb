##############################################################################################################
# How to create a resource group
# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
##############################################################################################################
resource "azurerm_resource_group" "this" {
  name     = var.rg_name
  location = var.location

  tags = var.default_tags
}
