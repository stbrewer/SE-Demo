variable "AWS_Account" {
  type        = string
  default     = "AWS-Environment"
}

variable "AWS_Region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "us-east-1"
}

variable "AWS_Transit_GW" {
  type        = string
  default     = "7eleven-AWS-Transit-GW"
}

variable "AWS_Transit_VPC" {
  type        = string
  default     = "7eleven-AWS-Transit"
}

variable "AWS_Spoke_GW_1" {
  type        = string
  default     = "7eleven-AWS-Spoke-GW-1"
}

variable "AWS_Spoke_VPC_1" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-AWS-VPC-Spoke-1"
}

variable "AWS_Spoke_GW_2" {
  type        = string
  default     = "7eleven-AWS-Spoke-GW-2"
}

variable "AWS_Spoke_VPC_2" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-AWS-VPC-Spoke-2"
}

variable "Azure_Region" {
  type        = string
}

variable "Azure_Resource_Group" {
  type        = string
}

variable "Azure_Spoke_VPC_1" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-Azure-VPC-Spoke-1"
}

variable "Azure_Spoke_GW_1" {
  type        = string
  default     = "7eleven-Azure-Spoke-GW-1"
}

variable "Azure_Spoke_VPC_2" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-Azure-VPC-Spoke-2"
}

variable "Azure_Spoke_GW_2" {
  type        = string
  default     = "7eleven-Azure-Spoke-GW-2"
}

variable "Azure_Transit_VPC" {
  type        = string
  default     = "7eleven-Azure-Transit"
}

variable "Azure_Transit_GW" {
  type        = string
  default     = "7eleven-Azure-Transit-GW"
}

variable "GCP_Spoke_VPC_1" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-gcp-gcp-spoke-1"
}

variable "GCP_Spoke_GW_1" {
  type        = string
  default     = "7eleven-gcp-spoke-gw-1"
}

variable "GCP_Spoke_VPC_2" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-gcp-vpc-spoke-2"
}

variable "GCP_Spoke_GW_2" {
  type        = string
  default     = "7eleven-gcp-spoke-gw-2"
}

variable "GCP_Transit_VPC" {
  type        = string
  default     = "7eleven-gcp-transit"
}

variable "GCP_Transit_GW" {
  type        = string
  default     = "7eleven-gcp-transit-gw"
}

variable "OCI_Spoke_VPC_1" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-OCI-OCI-Spoke-1"
}

variable "OCI_Spoke_GW_1" {
  type        = string
  default     = "7eleven-OCI-Spoke-GW-1"
}

variable "OCI_Spoke_VPC_2" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "7eleven-OCI-VPC-Spoke-2"
}

variable "OCI_Spoke_GW_2" {
  type        = string
  default     = "7eleven-OCI-Spoke-GW-2"
}

variable "OCI_Transit_VPC" {
  type        = string
  default     = "7eleven-OCI-Transit"
}

variable "OCI_Transit_GW" {
  type        = string
  default     = "7eleven-OCI-Transit-GW"
}

variable "Prod_Smartgroup" {
  type        = string
  default     = "Prod-Workloads"
}

variable "Dev_Smartgroup" {
  type        = string
  default     = "Dev-Workloads"
}

variable "QA_Smartgroup" {
  type        = string
  default     = "QA-Workloads"
}

variable "App_1" {
  type        = string
  default     = "QA-Workloads"
}

variable "Webgroup_1" {
  type        = string
  default     = "WG-Github"
}

variable "Webgroup_1_SNI_Filter" {
  type        = string
  default     = "*.example.com"
}

variable "subnet_index" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "0"
}