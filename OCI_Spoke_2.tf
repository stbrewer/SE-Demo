
resource "aviatrix_vpc" "OCI_Spoke_2_VPC" {
  cloud_type   = 16
  account_name = "Oracle_Environment"
  region       = "us-ashburn-1"
  name         = var.OCI_Spoke_VPC_2
  cidr         = "10.20.0.0/24"
}

resource "aviatrix_spoke_gateway" "OCI_Spoke_2_GW" {
  cloud_type          = 16
  account_name        = "Oracle_Environment"
  gw_name             = var.OCI_Spoke_GW_2
  vpc_id              = aviatrix_vpc.OCI_Spoke_2_VPC.vpc_id
  vpc_reg             = "us-ashburn-1"
  gw_size             = "VM.Standard2.2"
  subnet              = aviatrix_vpc.OCI_Spoke_2_VPC.subnets[0].cidr
  availability_domain = aviatrix_vpc.OCI_Spoke_2_VPC.availability_domains[0]
  fault_domain        = aviatrix_vpc.OCI_Spoke_2_VPC.fault_domains[0]
  manage_ha_gateway   = false
}

resource "aviatrix_spoke_transit_attachment" "OCI_Spoke_2_Attachment" {
  spoke_gw_name   = aviatrix_spoke_gateway.OCI_Spoke_2_GW.gw_name
  transit_gw_name = aviatrix_transit_gateway.OCI_Transit_GW.gw_name
}
