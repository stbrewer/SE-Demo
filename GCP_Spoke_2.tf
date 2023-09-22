resource "aviatrix_vpc" "GCP_Spoke_VPC_2" {
  cloud_type           = 4
  account_name         = "GCP_Environment"
  subnets {
    name   = "subnet-3"
    region = "us-east1"
    cidr   = "10.140.0.0/23"
  }
  name                 = var.GCP_Spoke_VPC_2
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_spoke_gateway" "GCP_Spoke_GW_2" {
  cloud_type        = 4
  account_name      = "GCP_Environment"
  gw_name           = var.GCP_Spoke_GW_2
  vpc_id            = aviatrix_vpc.GCP_Spoke_VPC_2.vpc_id
  vpc_reg           = "us-east1-b" 
  gw_size           = "n1-standard-1"
  subnet            = aviatrix_vpc.GCP_Spoke_VPC_2.subnets[0].cidr
  single_ip_snat    = false
}

resource "aviatrix_spoke_transit_attachment" "GCP_Spoke_2_Attachment" {
  spoke_gw_name   = aviatrix_spoke_gateway.GCP_Spoke_GW_2.gw_name
  transit_gw_name = aviatrix_transit_gateway.GCP_Transit_GW.gw_name
}

