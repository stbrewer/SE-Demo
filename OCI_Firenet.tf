
resource "aviatrix_firenet" "OCI_Firenet" {
  vpc_id                               = aviatrix_vpc.OCI_Transit_VPC.vpc_id
  inspection_enabled                   = true
  egress_enabled                       = false
  keep_alive_via_lan_interface_enabled = false
}


resource "aviatrix_firewall_instance" "OCI_Firewall_Instance" {
  vpc_id            = aviatrix_vpc.OCI_Transit_VPC.vpc_id
  firenet_gw_name   = var.OCI_Transit_GW
  firewall_name     = "OCI-Firewall-1"
  firewall_image    = "VM-Series-11.0.2"
  firewall_size     = "VM.Standard2.4"
  management_subnet = aviatrix_vpc.OCI_Transit_VPC.subnets[0].cidr
  egress_subnet     = aviatrix_vpc.OCI_Transit_VPC.subnets[1].cidr
  availability_domain = "US-ASHBURN-AD-1"
  fault_domain      = "FAULT-DOMAIN-1"
}   

resource "aviatrix_firewall_instance_association" "firewall_instance_association_4" {
  vpc_id               = aviatrix_firewall_instance.OCI_Firewall_Instance.vpc_id
  firenet_gw_name      = var.OCI_Transit_GW
  instance_id          = aviatrix_firewall_instance.OCI_Firewall_Instance.instance_id
  firewall_name        = aviatrix_firewall_instance.OCI_Firewall_Instance.firewall_name
  lan_interface        = aviatrix_firewall_instance.OCI_Firewall_Instance.lan_interface
  management_interface = aviatrix_firewall_instance.OCI_Firewall_Instance.management_interface
  egress_interface     = aviatrix_firewall_instance.OCI_Firewall_Instance.egress_interface
  attached             = true
}
