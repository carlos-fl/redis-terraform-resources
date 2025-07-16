resource "azurerm_redis_cache" "cache" {
  name = "cache-${  var.project }-${ var.environment }"
  location = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  family = "C"
  sku_name = "Basic"
  capacity = 0
  tags = var.tags
}