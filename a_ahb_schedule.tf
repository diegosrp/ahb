########################################################################################################################
# How to associate the schedule with the runbook
# Reference - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_job_schedule
########################################################################################################################
resource "azurerm_automation_job_schedule" "ahb" {
  resource_group_name     = azurerm_resource_group.this.name
  automation_account_name = azurerm_automation_account.this.name
  schedule_name           = var.schedule_name
  runbook_name            = var.ahb_runbook_name

  depends_on = [
    azurerm_automation_runbook.ahb
  ]
}
