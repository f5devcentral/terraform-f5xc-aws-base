variable "project_prefix" {
  type        = string
  description = "projectPrefix name for tagging"
}
variable "resource_owner" {
  type        = string
  description = "Owner of the deployment for tagging purposes"
}

variable "trusted_ip" {
  type        = string
  description = "IP to allow external access"
}


variable "aws_region" {
  description = "aws region"
  type        = string
}


variable "services_vpc_cidr_block" {
  type = string
}
variable "services_vpc" {
  description = "Services VPC"
  type        = map(any)
}
variable "spoke_vpc_cidr_block" {
  type = string
}
variable "spoke_vpc" {
  description = "Spoke VPC"
  type        = map(any)
}
variable "spoke2_vpc_cidr_block" {
  type = string
}
variable "spoke2_vpc" {
  description = "Spoke VPC"
  type        = map(any)
}

variable "create_jumphost" {
  description = "Create a jumphost for troubleshooting purposes (true or false)"
  type        = bool
}
variable "ami_search_name" {
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20230112"
  description = "AWS AMI search filter to find correct image (Ubuntu) for region"
}
variable "ssh_key" {
  description = "SSH public key used to create an EC2 keypair"
  type        = string
}