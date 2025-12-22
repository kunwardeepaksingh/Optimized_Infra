data "azurerm_subnet" "subnets" {
  for_each = var.nic_config
    name = each.value.subnet_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = "deepak-vnet"
}

data "azurerm_public_ip" "pip" {
  for_each = var.nic_config
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
