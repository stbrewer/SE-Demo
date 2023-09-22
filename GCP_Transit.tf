
resource "aviatrix_transit_gateway" "GCP_Transit_GW" {
  cloud_type               = 4
  account_name             = "GCP_Environment"
  gw_name                  = var.GCP_Transit_GW
  vpc_id                   = aviatrix_vpc.GCP_Transit_VPC.vpc_id
  vpc_reg                  = "us-east1-b"
  gw_size                  = "n1-standard-1"
  subnet                   = aviatrix_vpc.GCP_Transit_VPC.subnets[0].cidr
  connected_transit        = true
  enable_segmentation      = true
  local_as_number          = "65015"
  enable_transit_firenet   = false
}

resource "aviatrix_vpc" "GCP_Transit_VPC" {
  cloud_type           = 4
  account_name         = "GCP_Environment"
  subnets {
    name   = "subnet-1"
    region = "us-east1"
    cidr   = "10.120.0.0/23"
  }
  name                 = var.GCP_Transit_VPC
}
