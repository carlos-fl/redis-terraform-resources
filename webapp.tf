resource "azurerm_service_plan" "redis-api" {
  name = "redis-${ var.project }-${ var.environment }-server"
  location = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku_name = "F1"
  os_type = "Linux"
}


resource "azurerm_linux_web_app" "api" {
  name = "redis-${ var.project }-${ var.environment }-api"
  location = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  service_plan_id = azurerm_service_plan.redis-api.id

  site_config {
    always_on = false
    application_stack {
      docker_registry_url = "https://index.docker.io"
      docker_image_name = "nginx:latest"
    }
  }

  app_settings = {
    WEBSITES_PORT = "80"
  }

  tags = var.tags
}

