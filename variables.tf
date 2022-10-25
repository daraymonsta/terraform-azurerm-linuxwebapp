variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of Azure resource"
  default     = "West Europe"
}

variable "service_plan_name" {
  description = "Service plan name"
}

variable "app_name" {
  description = "Name of application"
}

variable "app_insights_name" {
  description = "Name of application insights"
  default     = "default892"
}

variable "workspace_name" {
  description = "Name of log analytics workspace"
  default     = "workspace-test"
}
