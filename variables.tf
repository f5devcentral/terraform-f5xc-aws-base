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