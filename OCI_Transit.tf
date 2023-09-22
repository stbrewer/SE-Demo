
resource "aviatrix_vpc" "OCI_Transit_VPC" {
  cloud_type   = 16
  account_name = "Oracle_Environment"
  region       = "us-ashburn-1"
  name         = var.OCI_Transit_VPC
  cidr         = "10.25.0.0/23"
}

resource "aviatrix_transit_gateway" "OCI_Transit_GW" {
  cloud_type          = 16
  account_name        = "Oracle_Environment"
  gw_name             = var.OCI_Transit_GW
  vpc_id              = aviatrix_vpc.OCI_Transit_VPC.vpc_id
  vpc_reg             = "us-ashburn-1"
  gw_size             = "VM.Standard2.4"
  subnet              = aviatrix_vpc.OCI_Transit_VPC.subnets[0].cidr
  availability_domain = aviatrix_vpc.OCI_Transit_VPC.availability_domains[0]
  fault_domain        = aviatrix_vpc.OCI_Transit_VPC.fault_domains[0]
  enable_transit_firenet   = true
}
