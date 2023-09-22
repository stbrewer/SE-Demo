

resource "aviatrix_firenet" "Azure_Firenet" {
  vpc_id                               = aviatrix_vpc.Azure_Transit_VPC.vpc_id
  inspection_enabled                   = true
  egress_enabled                       = false
  keep_alive_via_lan_interface_enabled = false

}

resource "aviatrix_firewall_instance" "Azure_Firewall_Instance" {
  vpc_id            = aviatrix_vpc.Azure_Transit_VPC.vpc_id
  firenet_gw_name   = var.Azure_Transit_GW
  firewall_name     = "Azure-Firewall-1"
  firewall_image    = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
  firewall_size     = "Standard_D3_v2"
  username          = "panuser"
  management_subnet = aviatrix_vpc.Azure_Transit_VPC.subnets[0].cidr
  egress_subnet     = aviatrix_vpc.Azure_Transit_VPC.subnets[1].cidr
}

resource "aviatrix_firewall_instance_association" "firewall_instance_association_2" {
  vpc_id               = aviatrix_firewall_instance.Azure_Firewall_Instance.vpc_id
  firenet_gw_name      = var.Azure_Transit_GW
  instance_id          = aviatrix_firewall_instance.Azure_Firewall_Instance.instance_id
  firewall_name        = aviatrix_firewall_instance.Azure_Firewall_Instance.firewall_name
  lan_interface        = aviatrix_firewall_instance.Azure_Firewall_Instance.lan_interface
  management_interface = aviatrix_firewall_instance.Azure_Firewall_Instance.management_interface
  egress_interface     = aviatrix_firewall_instance.Azure_Firewall_Instance.egress_interface
  attached             = true
}

#Make sure to change the below values for each customer. 
/*
resource "aviatrix_transit_firenet_policy" "prod_transit_firenet_policy_azure" {
  transit_firenet_gateway_name = var.Azure_Transit_GW
  inspected_resource_name      = "SPOKE:AC-Azure-Spoke-GW-1"
}


resource "aviatrix_transit_firenet_policy" "dev_transit_firenet_policy" {
  transit_firenet_gateway_name = var.Azure_Transit_GW
  inspected_resource_name      = "SPOKE:AC-Azure-Spoke-GW-2"
}
*/