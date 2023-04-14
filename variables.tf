variable "subscription_id" {
  description = "subscription id in which azure resources to be created and billed"
  type        = string
}

variable "location" {
  type        = string
  description = "default region"
}

variable "rg_name" {
  type        = string
  description = "resource group name"
  default     = "rg-automation"
}

variable "aa_name" {
  type        = string
  description = "automation account name"
  default     = "aa-finops"
}

variable "ahb_runbook_name" {
  type        = string
  description = "runbook name in automation account"
  default     = "ahb"
}

variable "schedule_name" {
  type        = string
  description = "schedule name in automation account"
  default     = "Monthly"
}

variable "mg_id" {
  description = "management group id that will be given permission to change the ahb configuration"
  type        = string
}

variable "default_tags" {
  description = "Default TAGs for Azure Resources"
  type        = map(any)
  default = {
    deployedby          = "terraform"
    department          = "automation"
    data-classification = "internal"
  }
}
