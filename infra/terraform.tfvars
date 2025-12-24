rgs_x = {
  "rg" = {
    rg_name = "deepak-rg"
    location = "centralindia"
  }
}

vnets_x = {
  "vnet" = {
    virtual_network_name = "deepak-vnet"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "deepak-rg"
  }
}
subnets_x = {
  "subnet1" = {
    subnet_name = "front-subnet"
    resource_group_name  = "deepak-rg"
    virtual_network_name = "deepak-vnet"
    address_prefixes      = ["10.0.1.0/24"]
  }
  "subnet2" = {
    subnet_name = "back-subnet"
    resource_group_name  = "deepak-rg"
    virtual_network_name = "deepak-vnet"
    address_prefixes      = ["10.0.2.0/24"]
  }
}


pips_x = {
  "pip1" = {
    pip_name = "front-pip"
    location            = "centralindia"
    resource_group_name = "deepak-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  "pip2" = {
    pip_name            = "back-pip"
    location            = "centralindia"
    resource_group_name = "deepak-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
nic_config_x = {
  "nic1" = {
    name_nic            = "front-nic"
    location            = "centralindia"
    subnet_name         = "front-subnet"
    pip_name            = "front-pip"
    resource_group_name = "deepak-rg"
    ip_configuration = [{
      name_config                   = "front-ipconfig"
      private_ip_address_allocation = "Dynamic"
    }]
  }


  "nic2" = {
    name_nic            = "back-nic"
    location            = "centralindia"
    subnet_name         = "back-subnet"
    pip_name            = "back-pip"
    resource_group_name = "deepak-rg"
    ip_configuration = [{
      name_config                   = "back-ipconfig"
      private_ip_address_allocation = "Dynamic"
    }]
  }
}

vm_x = {
  "vm1" = {
    Vm_name                   = "front-vm1"
    location                  = "centralindia"
    resource_group_name       = "deepak-rg"
    size                      = "Standard_D2s_v3"
    admin_username            = "vmusername"
    admin_password            = "vmpassname"
    name_net_interface        = "front-nic"

    os_disk = {
      "os1" = {
      name                 = "osdisk1"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = 30
      }
    }
    source_image_reference = {
      "image1" = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-LTS"
      version   = "latest"
      }
    }
  }

  "vm2" = {
    Vm_name                   = "back-vm2"
    location                  = "centralindia"
    resource_group_name       = "deepak-rg"
    size                      = "Standard_D2s_v3"
    admin_username            = "vmusername"
    admin_password            = "vmpassname"
    name_net_interface        = "back-nic"

    os_disk = {
      "os2" = {
      name                 = "osdisk2"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = 30
      }
    }
    source_image_reference = {
      "image2" = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-LTS"
      version   = "latest"
      }
    }
  }
}