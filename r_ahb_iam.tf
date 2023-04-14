###############################################################################################################
# How to create a role assignment
# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment
###############################################################################################################
resource "azurerm_role_assignment" "vm_contributor_x_mg_aa" {
  scope                = "/providers/Microsoft.Management/managementGroups/${var.mg_id}"
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azurerm_automation_account.this.identity[0].principal_id
}
