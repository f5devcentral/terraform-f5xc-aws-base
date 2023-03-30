output project_prefix {
  value = var.project_prefix
}
output aws_region {
  value = var.aws_region
}
output aws_az1 {
  value = var.services_vpc.azs["az1"]["az"]
}
output aws_az2 {
  value = var.services_vpc.azs["az2"]["az"]
}
output aws_az3 {
  value = var.services_vpc.azs["az3"]["az"]
}
output external_subnets {
  value = aws_subnet.f5-xc-services-external
}
output internal_subnets {
  value = aws_subnet.f5-xc-services-internal
}
output workload_subnets {
  value = aws_subnet.f5-xc-services-workload
}
output spoke_external_subnets { 
  value   = aws_subnet.f5-xc-spoke-external
}
output spoke_workload_subnets {
  value = aws_subnet.f5-xc-spoke-workload
}
output security_group {
  value   = aws_security_group.f5-xc-vpc.id
}
output vpc_id {
  value = aws_vpc.f5-xc-services.id
}
output spoke_vpc_id{
  value = aws_vpc.f5-xc-spoke.id
}
output spoke_security_group {
  value = aws_security_group.f5-xc-spoke-vpc.id
}

output spoke2_external_subnets { 
  value   = aws_subnet.f5-xc-spoke2-external
}
output spoke2_workload_subnets {
  value = aws_subnet.f5-xc-spoke2-workload
}

output spoke2_vpc_id{
  value = aws_vpc.f5-xc-spoke2.id
}
output spoke2_security_group {
  value = aws_security_group.f5-xc-spoke2-vpc.id
}

output service_external_route_table {
  value = aws_route_table.f5-xc-services-vpc-external-rt.id
}

output service_cidr_block {
  value = var.services_vpc_cidr_block
}

output "jumphost_spoke1_public_ip" {
  value       = var.create_jumphost == true ? aws_instance.jumphost[0].public_ip : null
  description = "Public IP address of jumphost in spoke 1"
}