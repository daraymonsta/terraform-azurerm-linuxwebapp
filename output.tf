output "instrumentation_key" {
  value = azurerm_application_insights.appinsight.instrumentation_key
}

output "webapp_id" {
  value = azurerm_linux_web_app.app.id
}

output "webapp_url" {
  value = azurerm_linux_web_app.app.default_hostname
}