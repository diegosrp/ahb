####################################################################################################################
# How to create a schedule in automation account
# Reference - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_schedule
####################################################################################################################
resource "azurerm_automation_schedule" "this" {
  name                    = var.schedule_name
  resource_group_name     = azurerm_resource_group.this.name
  automation_account_name = azurerm_automation_account.this.name
  frequency               = "Month"
  interval                = 1
  timezone                = "Pacific/Auckland"
  start_time              = "2023-04-30T05:00:00+12:00"
  description             = "This schedule will run the monthly runbook on the last day of each month at 5:00AM NZ time"
  month_days              = [-1]
}
