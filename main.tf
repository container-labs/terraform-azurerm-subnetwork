locals {
  virtual_network_name = regex(".*/virtual[n|N]etworks/(.*)$", var.virtual_network_id)[0]
  cidr                 = module.auto_cidr[0].result
}

# get the resource group of the virtual network.
# then add the subnet to that resource group
data "azurerm_resource_group" "virtual_network" {
  name = local.virtual_network_name
}

# you can't add a subnet from one resource group to another
# resource "azurerm_resource_group" "main" {
#   name     = var.name
#   location = var.region
#   tags     = var.tags
# }

resource "azurerm_subnet" "main" {
  name                 = var.name
  resource_group_name  = data.azurerm_resource_group.virtual_network.name
  virtual_network_name = local.virtual_network_name
  address_prefixes     = [cidrsubnet(local.cidr, 1, 0)]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "delegation"
    # Found a great resource for live-code and modules. Check it out here
    # https://github.com/claranet/terraform-azurerm-subnet/blob/master/examples/main/modules.tf#L68
    # check the service delegation block here
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
