# terraform-f5xc-aws-base
# tweak

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.54.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.f5-xc-spoke-nat](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/eip) | resource |
| [aws_eip.f5-xc-spoke2-nat](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/eip) | resource |
| [aws_instance.jumphost](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/instance) | resource |
| [aws_internet_gateway.f5-xc-services-vpc-gw](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/internet_gateway) | resource |
| [aws_internet_gateway.f5-xc-spoke-vpc-gw](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/internet_gateway) | resource |
| [aws_internet_gateway.f5-xc-spoke2-vpc-gw](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.f5-xc-spoke-vpc-nat](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.f5-xc-spoke2-vpc-nat](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/nat_gateway) | resource |
| [aws_network_acl_rule.deny_tcp_53](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.deny_udp_53](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.tcp_53](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.tcp_53-2](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.udp_53](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.udp_53-2](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/network_acl_rule) | resource |
| [aws_route.hub-to-spoke1](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.hub-to-spoke2](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.internet-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke-internet-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke-workload-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke1-external-to-hub](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke1-workload-to-hub](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke2-external-to-hub](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke2-internet-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke2-workload-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route.spoke2-workload-to-hub](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route) | resource |
| [aws_route_table.f5-xc-services-vpc-external-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table) | resource |
| [aws_route_table.f5-xc-spoke-vpc-external-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table) | resource |
| [aws_route_table.f5-xc-spoke-vpc-workload-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table) | resource |
| [aws_route_table.f5-xc-spoke2-vpc-external-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table) | resource |
| [aws_route_table.f5-xc-spoke2-vpc-workload-rt](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table) | resource |
| [aws_route_table_association.f5-xc-external-association](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.f5-xc-spoke-external-association](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.f5-xc-spoke-workload-association](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.f5-xc-spoke2-external-association](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.f5-xc-spoke2-workload-association](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/route_table_association) | resource |
| [aws_security_group.f5-xc-spoke-vpc](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/security_group) | resource |
| [aws_security_group.f5-xc-spoke2-vpc](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/security_group) | resource |
| [aws_security_group.f5-xc-vpc](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/security_group) | resource |
| [aws_subnet.f5-xc-services-external](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-services-internal](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-services-workload](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke-external](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke-internal](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke-workload](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke2-external](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke2-internal](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke2-workload](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/subnet) | resource |
| [aws_vpc.f5-xc-services](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/vpc) | resource |
| [aws_vpc.f5-xc-spoke](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/vpc) | resource |
| [aws_vpc.f5-xc-spoke2](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/vpc) | resource |
| [aws_vpc_peering_connection.hubSpoke1](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection.hubSpoke2](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/vpc_peering_connection) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/data-sources/ami) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/3.2.1/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_search_name"></a> [ami\_search\_name](#input\_ami\_search\_name) | AWS AMI search filter to find correct image (Ubuntu) for region | `string` | `"ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20230112"` | no |
| <a name="input_auto_trust_localip"></a> [auto\_trust\_localip](#input\_auto\_trust\_localip) | if true, query ifconfig.io for public ip of terraform host. | `bool` | `false` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | aws region | `string` | n/a | yes |
| <a name="input_create_jumphost"></a> [create\_jumphost](#input\_create\_jumphost) | Create a jumphost for troubleshooting purposes (true or false) | `bool` | n/a | yes |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | projectPrefix name for tagging | `string` | n/a | yes |
| <a name="input_resource_owner"></a> [resource\_owner](#input\_resource\_owner) | Owner of the deployment for tagging purposes | `string` | n/a | yes |
| <a name="input_services_vpc"></a> [services\_vpc](#input\_services\_vpc) | Services VPC | `map(any)` | n/a | yes |
| <a name="input_services_vpc_cidr_block"></a> [services\_vpc\_cidr\_block](#input\_services\_vpc\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_spoke2_vpc"></a> [spoke2\_vpc](#input\_spoke2\_vpc) | Spoke VPC | `map(any)` | n/a | yes |
| <a name="input_spoke2_vpc_cidr_block"></a> [spoke2\_vpc\_cidr\_block](#input\_spoke2\_vpc\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_spoke_vpc"></a> [spoke\_vpc](#input\_spoke\_vpc) | Spoke VPC | `map(any)` | n/a | yes |
| <a name="input_spoke_vpc_cidr_block"></a> [spoke\_vpc\_cidr\_block](#input\_spoke\_vpc\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH public key used to create an EC2 keypair | `string` | n/a | yes |
| <a name="input_trusted_ip"></a> [trusted\_ip](#input\_trusted\_ip) | IP to allow external access | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_az1"></a> [aws\_az1](#output\_aws\_az1) | n/a |
| <a name="output_aws_az2"></a> [aws\_az2](#output\_aws\_az2) | n/a |
| <a name="output_aws_az3"></a> [aws\_az3](#output\_aws\_az3) | n/a |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | n/a |
| <a name="output_external_subnets"></a> [external\_subnets](#output\_external\_subnets) | n/a |
| <a name="output_internal_subnets"></a> [internal\_subnets](#output\_internal\_subnets) | n/a |
| <a name="output_jumphost_spoke1_public_ip"></a> [jumphost\_spoke1\_public\_ip](#output\_jumphost\_spoke1\_public\_ip) | Public IP address of jumphost in spoke 1 |
| <a name="output_project_prefix"></a> [project\_prefix](#output\_project\_prefix) | n/a |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | n/a |
| <a name="output_service_cidr_block"></a> [service\_cidr\_block](#output\_service\_cidr\_block) | n/a |
| <a name="output_service_external_route_table"></a> [service\_external\_route\_table](#output\_service\_external\_route\_table) | n/a |
| <a name="output_spoke2_external_subnets"></a> [spoke2\_external\_subnets](#output\_spoke2\_external\_subnets) | n/a |
| <a name="output_spoke2_security_group"></a> [spoke2\_security\_group](#output\_spoke2\_security\_group) | n/a |
| <a name="output_spoke2_vpc_id"></a> [spoke2\_vpc\_id](#output\_spoke2\_vpc\_id) | n/a |
| <a name="output_spoke2_workload_subnets"></a> [spoke2\_workload\_subnets](#output\_spoke2\_workload\_subnets) | n/a |
| <a name="output_spoke_external_subnets"></a> [spoke\_external\_subnets](#output\_spoke\_external\_subnets) | n/a |
| <a name="output_spoke_security_group"></a> [spoke\_security\_group](#output\_spoke\_security\_group) | n/a |
| <a name="output_spoke_vpc_id"></a> [spoke\_vpc\_id](#output\_spoke\_vpc\_id) | n/a |
| <a name="output_spoke_workload_subnets"></a> [spoke\_workload\_subnets](#output\_spoke\_workload\_subnets) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_workload_subnets"></a> [workload\_subnets](#output\_workload\_subnets) | n/a |
<!-- END_TF_DOCS -->