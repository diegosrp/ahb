###################################################################################################################
# How to create a runbook in automation account
# Reference - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_runbook
###################################################################################################################
resource "azurerm_automation_runbook" "ahb" {
  name                    = var.ahb_runbook_name
  location                = azurerm_resource_group.this.location
  resource_group_name     = azurerm_resource_group.this.name
  automation_account_name = azurerm_automation_account.this.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This script it will enable the azure hybrid benefit for all windows vm's"
  runbook_type            = "PowerShell"
  content                 = file("powershell/ahb_automation.ps1")

  tags = var.default_tags
}

