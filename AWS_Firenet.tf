
data "aws_availability_zones" "az_available_firenet" {
}

resource "aviatrix_firenet" "AWS-Firenet" {
  vpc_id                               = aviatrix_vpc.AWS_Transit_VPC.vpc_id
  inspection_enabled                   = true
  egress_enabled                       = false
  keep_alive_via_lan_interface_enabled = false

}

resource "aviatrix_firewall_instance" "AWS_Firewall_Instance" {
  vpc_id            = aviatrix_vpc.AWS_Transit_VPC.vpc_id
  firenet_gw_name   = var.AWS_Transit_GW
  firewall_name     = "AWS-Firewall-1"
  firewall_image    = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
  firewall_size     = "m5.xlarge"
  management_subnet = aviatrix_vpc.AWS_Transit_VPC.subnets[length(data.aws_availability_zones.az_available_firenet.names)]["cidr"]
  egress_subnet     = aviatrix_vpc.AWS_Transit_VPC.subnets[length(data.aws_availability_zones.az_available_firenet.names)]["cidr"]
}

resource "aviatrix_firewall_instance_association" "firewall_instance_association_1" {
  vpc_id               = aviatrix_firewall_instance.AWS_Firewall_Instance.vpc_id
  firenet_gw_name      = var.AWS_Transit_GW
  instance_id          = aviatrix_firewall_instance.AWS_Firewall_Instance.instance_id
  firewall_name        = aviatrix_firewall_instance.AWS_Firewall_Instance.firewall_name
  lan_interface        = aviatrix_firewall_instance.AWS_Firewall_Instance.lan_interface
  management_interface = aviatrix_firewall_instance.AWS_Firewall_Instance.management_interface
  egress_interface     = aviatrix_firewall_instance.AWS_Firewall_Instance.egress_interface
  attached             = true
}

#Make sure to change the below values for each customer. 
/*
resource "aviatrix_transit_firenet_policy" "prod_transit_firenet_policy" {
  transit_firenet_gateway_name = var.AWS_Transit_GW
  inspected_resource_name      = "SPOKE:AC-AWS-Spoke-GW-1"
}

resource "aviatrix_transit_firenet_policy" "dev_transit_firenet_policy" {
  transit_firenet_gateway_name = var.AWS_Transit_GW
  inspected_resource_name      = "SPOKE:AC-AWS-Spoke-GW-2"
}
*/