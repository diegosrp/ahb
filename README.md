[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

# Azure Hybrid Benefit Automation with Terraform + Automation Account
This repository contains Terraform code for automating the conversion of Windows VMs to Azure Hybrid Benefit (AHB) in Azure.

# What is Azure Hybrid Benefit (AHB)?
Azure Hybrid Benefit is a valuable cost-saving benefit that allows you to leverage your existing on-premises Windows Server and SQL Server licenses with active Software Assurance or subscriptions on Azure. By taking advantage of this benefit, you can save up to 85% compared to standard pay-as-you-go rates and achieve the lowest possible cost of ownership when you combine it with reservations savings and extended security updates. Azure Hybrid Benefit can also be applied to SQL on Azure and Azure Dedicated Host, and it provides dual-use rights for 180 days, enabling you to maintain your on-premises operations while migrating to Azure. Additionally, this benefit now extends to RedHat and SUSE Linux subscriptions, offering even more flexibility.

Moreover, I have automated the conversion to Azure Hybrid Benefit for Windows VM to make the process more streamlined and efficient. For more information on Azure Hybrid Benefit and how it can help you save costs on Azure, please visit https://azure.microsoft.com/en-us/pricing/hybrid-benefit/

---

# Terraform code
This repository contains Terraform code for automating the process of converting Windows VMs to Azure Hybrid Benefit. 
The Terraform code provisions the following Azure resources:

| # | Resource |  File Name |
|--|--|--
| 01 | Resource Group | r_resource_group.tf |
| 02 | Automation Account | r_automation_account.tf |
| 03 | Runbook in Automation Account | r_ahb_runbook.tf |
| 04 | Script for the Runbook | powershell/ahb_automation.ps1 |
| 05 | Schedule the Runbook in the Automation Account | r_schedule.tf |
| 06 | Associate the schedule in the runbook within the automation account | a_ahb_schedule.tf |
| 07 | Role Assignment in Management Group | r_ahb_iam.tf |

![image](https://user-images.githubusercontent.com/73967829/232182271-ba5f833e-486c-4c0d-b62e-7b63a22a0b2b.png)

## Inputs
The Terraform code requires the following input parameters:

| Name | Description | Type | Standard | Required |
|------|-------------|------|---------|:--------:|
| subscription_id | subscription id in which azure resources to be created and billed | `string` | `null` | Yes |
| location | default region | `string` | `null` | Yes |
| rg_name | resource group name | `string` | rg-automation | No |
| aa_name | automation account name | `string` | aa-finops | No |
| ahb_runbook_name | runbook name in automation account | `string` | ahb | No |
| schedule_name | schedule name in automation account | `string` | Monthly | No |
| mg_id | management group id that will be given permission to change the ahb configuration | `string` | `null` | Yes |



In Terraform automation, a resource group called "rg-automation" and an automation account called "aa-finops" are created. 
A runbook with a PowerShell script is created to enable the Azure Hybrid Benefit for all VMs in existing resource groups and subscriptions to which you grant permission.

In this case, the code is for the management group you specify and will run monthly on the last day of each month at 5:00 AM New Zealand time.

### NOTE: If you are going to use this code after 30/04/2023, it will be necessary to update the "start_time" parameter in the r_schedule.tf file.



