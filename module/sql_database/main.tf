resource "azurerm_mysql_database" "example" {
  name                = "exampledb"
  resource_group_name = "${azurerm_resource_group.example.name}"
  server_name         = "${azurerm_mysql_server.example.name}"
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}