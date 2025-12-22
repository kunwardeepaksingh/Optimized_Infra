module "resource_group" {
    source = "../module/resource_group"
    rgs = var.rgs_x
    
}

module "vnet" {
    depends_on = [module.resource_group ]
    source = "../module/virtual_network"
    vnets = var.vnets_x

}

module "subnet" {
    depends_on = [ module.resource_group,module.vnet ]
    source = "../module/subnet"
    subnets = var.subnets_x

}

module "pip" {
    depends_on = [ module.resource_group ]
    source = "../module/public_ip"
    pips = var.pips_x


}


module "nic" {
    depends_on = [ module.subnet,module.pip ]
    source = "../module/nic"
nic_config = var.nic_config_x
  
}
module "virtual_machine" {
    depends_on = [ module.resource_group,module.nic, module.pip, module.subnet ]
    source = "../module/virtual_machine"
    vm = var.vm_x

}