
resource "aviatrix_vpc" "AWS_Transit_VPC" {
  cloud_type           = 1
  account_name         = "AWS_Environment"
  region               = var.AWS_Region
  name                 = var.AWS_Transit_VPC
  cidr                 = "10.190.0.0/23"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

data "aws_availability_zones" "az_available_transit" {
}

resource "aviatrix_transit_gateway" "AWS_Transit_GW" {
  cloud_type               = 1
  account_name             = "AWS_Environment"
  gw_name                  = var.AWS_Transit_GW
  vpc_id                   = aviatrix_vpc.AWS_Transit_VPC.vpc_id
  vpc_reg                  = "us-east-1"
  gw_size                  = "c5n.xlarge"
  subnet                   = aviatrix_vpc.AWS_Transit_VPC.subnets[length(data.aws_availability_zones.az_available_transit.names)]["cidr"]
  tags                     = {
    name = "value"
  }
  enable_hybrid_connection = true
  connected_transit        = true
  enable_segmentation      = true
  local_as_number          = "65010"
  enable_transit_firenet   = true
}
