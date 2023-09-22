
resource "aviatrix_vpc" "Azure_Spoke_VPC_2" {
  cloud_type           = 8
  account_name         = "Azure_Environment"
  region               = var.Azure_Region
  name                 = var.Azure_Spoke_VPC_2
  cidr                 = "10.50.0.0/24"
  subnet_size          = "28"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
  num_of_subnet_pairs  = "4"
}

resource "aviatrix_spoke_gateway" "Azure_Spoke_GW_2" {
  cloud_type        = 8
  account_name      = "Azure_Environment"
  gw_name           = var.Azure_Spoke_GW_2
  vpc_id            = aviatrix_vpc.Azure_Spoke_VPC_2.vpc_id
  vpc_reg           = "East US" 
  gw_size           = "Standard_B1ms"
  subnet            = aviatrix_vpc.Azure_Spoke_VPC_2.subnets[0].cidr
  single_ip_snat    = false
}

resource "aviatrix_spoke_transit_attachment" "Azure_Spoke_2_Attachment" {
  spoke_gw_name   = aviatrix_spoke_gateway.Azure_Spoke_GW_2.gw_name
  transit_gw_name = aviatrix_transit_gateway.Azure_Transit_GW.gw_name
}

