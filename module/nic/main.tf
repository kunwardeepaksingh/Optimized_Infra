resource "azurerm_network_interface" "nic" {
    for_each = var.nic_config
  name                = each.value.name_nic
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {  
    name                          = ip_configuration.value.name_config
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
  }
  }
}
