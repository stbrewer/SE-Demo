

resource "aviatrix_vpc" "AWS_Spoke_VPC_2" {
  cloud_type           = 1
  account_name         = "AWS_Environment"
  region               = var.AWS_Region
  name                 = var.AWS_Spoke_VPC_2
  cidr                 = "10.170.0.0/24"
  subnet_size          = "28"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
  num_of_subnet_pairs  = "4"
}

data "aws_availability_zones" "az_available_spoke_2" {
}

resource "aviatrix_spoke_gateway" "AWS_Spoke_GW_2" {
  cloud_type        = 1
  account_name      = var.AWS_Account
  gw_name           = var.AWS_Spoke_GW_2
  vpc_id            = aviatrix_vpc.AWS_Spoke_VPC_2.vpc_id
  vpc_reg           = "us-east-1" 
  gw_size           = "t3.small"
  subnet            = aviatrix_vpc.AWS_Spoke_VPC_2.subnets[length(data.aws_availability_zones.az_available_spoke_2.names)]["cidr"]
  single_ip_snat    = false
}

resource "aviatrix_spoke_transit_attachment" "AWS_Spoke_2_Attachment" {
  spoke_gw_name   = aviatrix_spoke_gateway.AWS_Spoke_GW_2.gw_name
  transit_gw_name = aviatrix_transit_gateway.AWS_Transit_GW.gw_name
}

/*
resource "aviatrix_segmentation_network_domain" "Development_Segmentation_Network_Domain" {
  domain_name = "Development"
}

resource "aviatrix_segmentation_network_domain_association" "Dev_Segmentation_Network_Domain_Association" {
  network_domain_name  = aviatrix_segmentation_network_domain.Development_Segmentation_Network_Domain.domain_name
  attachment_name      = var.AWS_Spoke_GW_2
}
*/



