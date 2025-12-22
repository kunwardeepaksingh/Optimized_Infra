variable "vm" {
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