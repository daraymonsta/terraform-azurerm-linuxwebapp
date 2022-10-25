# terraform-azurerm-linuxwebapp
Terraform module for provision of Azure service plan (Linux, free tier), Application Insights and an App service

Requirements: an existing Resource Group

## Usage

Terraform code to call the module files found in this repo.

```
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.26.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


resource "random_pet" "prefix" {}

resource "azurerm_resource_group" "rg-app" {
  name     = "RG-DEV-US-${random_pet.prefix.id}"
  location = "West US 3"
}

module "webapp" {
  source              = "<source>"
  service_plan_name   = "APPPLAN-DEV-US-${random_pet.prefix.id}"
  app_name            = "APP-DEV-US-${random_pet.prefix.id}-app"
  app_insights_name   = "APP-DEV-US-${random_pet.prefix.id}-app-insights"
  location            = azurerm_resource_group.rg-app.location
  resource_group_name = azurerm_resource_group.rg-app.name
}

output "webapp_url" {
  value = module.webapp.webapp_url
}
```
