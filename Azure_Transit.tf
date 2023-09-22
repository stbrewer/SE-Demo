resource "aviatrix_transit_gateway" "Azure_Transit_GW" {
  cloud_type               = 8
  account_name             = "Azure_Environment"
  gw_name                  = var.Azure_Transit_GW
  vpc_id                   = aviatrix_vpc.Azure_Transit_VPC.vpc_id
  vpc_reg                  = "East US"
  gw_size                  = "Standard_B2ms"
  subnet                   = aviatrix_vpc.Azure_Transit_VPC.subnets[0].cidr
  connected_transit        = true
  enable_segmentation      = true
  local_as_number          = "65014"
  enable_transit_firenet   = true
}

resource "aviatrix_vpc" "Azure_Transit_VPC" {
  cloud_type           = 8
  account_name         = "Azure_Environment"
  region               = var.Azure_Region
  name                 = var.Azure_Transit_VPC
  cidr                 = "10.70.0.0/23"
  aviatrix_firenet_vpc = true
}