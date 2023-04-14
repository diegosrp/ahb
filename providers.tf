#####################################################################################
# How to configure azure provider
# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
#####################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.51.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
