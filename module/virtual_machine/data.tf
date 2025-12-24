data "azurerm_network_interface" "net_front" {
  for_each = var.vm
  name                = each.value.name_net_interface
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kvk" {

  name = "keyvltdee"
  resource_group_name = "deepakrg"

}

data "azurerm_key_vault_secret" "kvs_user" {
   
   name = "vmusername"
   key_vault_id = data.azurerm_key_vault.kvk.id

}

data "azurerm_key_vault_secret" "kvs_pass" {
  name = "vmpassname"
  key_vault_id = data.azurerm_key_vault.kvk.id
}