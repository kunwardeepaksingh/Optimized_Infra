data "azurerm_network_interface" "net_front" {
  for_each = var.vm
  name                = each.value.name_net_interface
  resource_group_name = each.value.resource_group_name
}