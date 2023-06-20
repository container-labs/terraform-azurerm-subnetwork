terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
    utility = {
      source = "massdriver-cloud/utility"
    }
  }
}
