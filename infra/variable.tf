variable "rgs_x" {
  type = map(object({
    rg_name  = string
    location = string
  }))
}

variable "vnets_x" {
  type = map(object({
    virtual_network_name = string
    location             = string
    resource_group_name  = string
    address_space        = list(string)
  }))
}

variable "subnets_x" {
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "pips_x" {
  type = map(object({
    pip_name            = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                = string
  }))
}
variable "nic_config_x" {
  type = map(object({
    name_nic            = string
    location            = string
    pip_name            = string
    subnet_name         = string
    resource_group_name = string
    ip_configuration = list(object({
      name_config                   = string
      private_ip_address_allocation = string

    }))
  }))
}
variable "vm_x" {
  type = map(object({
    Vm_name                   = string
    location                  = string
    resource_group_name       = string
    size                      = string
    admin_username            = string
    admin_password            = string
    name_net_interface        = string

    os_disk = map(object({
        name                 = string
        caching              = string
        storage_account_type = string
        disk_size_gb        = number
    }))
    source_image_reference = map(object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
    }))
  }))
}