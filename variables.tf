variable "projectPrefix" {
  type        = string
  description = "projectPrefix name for tagging"
}
variable "resourceOwner" {
  type        = string
  description = "Owner of the deployment for tagging purposes"
}

variable "trusted_ip" {
  type        = string
  description = "IP to allow external access"
}


variable "awsRegion" {
  description = "aws region"
  type        = string
}


variable "servicesVpcCidrBlock" {
  type = string
}
variable "servicesVpc" {
  description = "Services VPC"
  type        = map(any)
}
variable "spokeVpcCidrBlock" {
  type = string
}
variable "spokeVpc" {
  description = "Spoke VPC"
  type        = map(any)
}
variable "spoke2VpcCidrBlock" {
  type = string
}
variable "spoke2Vpc" {
  description = "Spoke VPC"
  type        = map(any)
}

variable "createJumphost" {
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