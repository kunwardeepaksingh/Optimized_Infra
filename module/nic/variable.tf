variable "nic_config" {
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
