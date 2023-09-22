All Four Clouds:
Transits: terraform apply -target="aviatrix_vpc.AWS_Transit_VPC" -target="aviatrix_transit_gateway.AWS_Transit_GW" -target="aviatrix_vpc.Azure_Transit_VPC" -target="aviatrix_transit_gateway.Azure_Transit_GW" -target="aviatrix_vpc.GCP_Transit_VPC" -target="aviatrix_transit_gateway.GCP_Transit_GW" -target="aviatrix_vpc.OCI_Transit_VPC" -target="aviatrix_transit_gateway.OCI_Transit_GW" -var-file="Variables.tfvars"
Spokes: terraform apply -target="aviatrix_vpc.AWS_Spoke_VPC_1" -target="aviatrix_spoke_gateway.AWS_Spoke_GW_1" -target="aviatrix_vpc.AWS_Spoke_VPC_2" -target="aviatrix_spoke_gateway.AWS_Spoke_GW_2" -target="aviatrix_vpc.Azure_Spoke_VPC_1" -target="aviatrix_vpc.Azure_Spoke_VPC_2"  -target="aviatrix_spoke_gateway.Azure_Spoke_GW_1" -target="aviatrix_spoke_gateway.Azure_Spoke_GW_2" -target="aviatrix_vpc.GCP_Spoke_VPC_1" -target="aviatrix_vpc.GCP_Spoke_VPC_2"  -target="aviatrix_spoke_gateway.GCP_Spoke_GW_1" -target="aviatrix_spoke_gateway.GCP_Spoke_GW_2" -target="aviatrix_vpc.OCI_Spoke_1_VPC" -target="aviatrix_vpc.OCI_Spoke_2_VPC"  -target="aviatrix_spoke_gateway.OCI_Spoke_1_GW" -target="aviatrix_spoke_gateway.OCI_Spoke_2_GW" -var-file="Variables.tfvars"
GW Attachments: terraform apply -target="aviatrix_spoke_transit_attachment.AWS_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.AWS_Spoke_2_Attachment" -target="aviatrix_spoke_transit_attachment.Azure_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.Azure_Spoke_2_Attachment" -target="aviatrix_spoke_transit_attachment.GCP_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.GCP_Spoke_2_Attachment" -target="aviatrix_spoke_transit_attachment.OCI_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.OCI_Spoke_2_Attachment" -var-file="Variables.tfvars"
FireNets: 

AWS:
Transits: terraform apply -target="aviatrix_vpc.AWS_Transit_VPC" -target="aviatrix_transit_gateway.AWS_Transit_GW" -var-file="Variables.tfvars"
Spokes: terraform apply -target="aviatrix_vpc.AWS_Spoke_VPC_1" -target="aviatrix_spoke_gateway.AWS_Spoke_GW_1" -target="aviatrix_vpc.AWS_Spoke_VPC_2" -target="aviatrix_spoke_gateway.AWS_Spoke_GW_2" -var-file="Variables.tfvars"
GW Attachments: terraform apply -target="aviatrix_spoke_transit_attachment.AWS_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.AWS_Spoke_2_Attachment" -var-file="Variables.tfvars"
FireNet: terraform apply -target="aviatrix_firenet.AWS-Firenet" -target="aviatrix_firewall_instance.AWS_Firewall_Instance" -target="aviatrix_firewall_instance_association.firewall_instance_association_1" -var-file="Variables.tfvars"

Azure
Transits: terraform apply -target="aviatrix_vpc.Azure_Transit_VPC" -target="aviatrix_transit_gateway.Azure_Transit_GW" -var-file="Variables.tfvars"
Spokes: terraform apply -target="aviatrix_vpc.Azure_Spoke_VPC_1" -target="aviatrix_vpc.Azure_Spoke_VPC_2"  -target="aviatrix_spoke_gateway.Azure_Spoke_GW_1" -target="aviatrix_spoke_gateway.Azure_Spoke_GW_2" -var-file="Variables.tfvars"
GW Attachments: terraform apply -target="aviatrix_spoke_transit_attachment.Azure_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.Azure_Spoke_2_Attachment" -var-file="Variables.tfvars"
FireNet: -target="aviatrix_firenet.Azure_Firenet" -target="aviatrix_firewall_instance.Azure_Firewall_Instance" -target="aviatrix_firewall_instance_association.firewall_instance_association_2" -var-file="Variables.tfvars"

GCP
Transits: terraform apply -target="aviatrix_vpc.GCP_Transit_VPC" -target="aviatrix_transit_gateway.GCP_Transit_GW" -var-file="Variables.tfvars"
Spokes:terraform apply -target="aviatrix_vpc.GCP_Spoke_VPC_1" -target="aviatrix_vpc.GCP_Spoke_VPC_2"  -target="aviatrix_spoke_gateway.GCP_Spoke_GW_1" -target="aviatrix_spoke_gateway.GCP_Spoke_GW_2" -var-file="Variables.tfvars"
GW Attachments: terraform apply -target="aviatrix_spoke_transit_attachment.GCP_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.GCP_Spoke_2_Attachment" -var-file="Variables.tfvars"
FireNet:

OCI: 
Transits: terraform apply -target="aviatrix_vpc.OCI_Transit_VPC" -target="aviatrix_transit_gateway.OCI_Transit_GW" -var-file="Variables.tfvars"
Spokes: terraform apply -target="aviatrix_vpc.OCI_Spoke_1_VPC" -target="aviatrix_vpc.OCI_Spoke_2_VPC"  -target="aviatrix_spoke_gateway.OCI_Spoke_1_GW" -target="aviatrix_spoke_gateway.OCI_Spoke_2_GW" -var-file="Variables.tfvars"
GW Attachments: terraform apply -target="aviatrix_spoke_transit_attachment.OCI_Spoke_1_Attachment" -target="aviatrix_spoke_transit_attachment.OCI_Spoke_2_Attachment" -var-file="Variables.tfvars"
FireNet: terraform apply -target="aviatrix_firenet.OCI_Firenet" -target="aviatrix_firewall_instance.OCI_Firewall_Instance" -target="aviatrix_firewall_instance_association.firewall_instance_association_4" -var-file="Variables.tfvars"

Distributed Firewall
terraform apply -target="aviatrix_distributed_firewalling_config.Turn-On-FW" -target="aviatrix_smart_group.Prod_Smartgroup" -target="aviatrix_smart_group.QA_Smartgroup" -target="aviatrix_smart_group.Dev_Smartgroup" -target="aviatrix_web_group.Webgroup_1" -target="aviatrix_distributed_firewalling_policy_list.Secure-Egress-Policy" -target="aviatrix_smart_group.Web_Tier"  -target="aviatrix_smart_group.App_Tier"  -target="aviatrix_smart_group.DB_Tier" -target="aviatrix_smart_group.Rewards_Smartgroup" -target="aviatrix_smart_group.Delivery_Smartgroup" -target="aviatrix_smart_group.Collection_Smartgroup" -var-file="Variables.tfvars" -auto-approve

Clean Up:
terraform destroy -var-file="Variables.tfvars" -auto-approve