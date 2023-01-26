# terraform-f5xc-aws-base
# tweak

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.f5-xc-services-vpc-gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_internet_gateway.f5-xc-spoke-vpc-gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_internet_gateway.f5-xc-spoke2-vpc-gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_network_acl_rule.deny_tcp_53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.deny_udp_53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.tcp_53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.tcp_53-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.udp_53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.udp_53-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_route.internet-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.spoke-internet-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.spoke2-internet-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.f5-xc-services-vpc-external-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.f5-xc-spoke-vpc-external-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.f5-xc-spoke2-vpc-external-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.f5-xc-external-association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.f5-xc-spoke-external-association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.f5-xc-spoke2-external-association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.f5-xc-spoke-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.f5-xc-spoke2-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.f5-xc-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.f5-xc-services-external](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-services-internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-services-workload](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke-external](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke-internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke-workload](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke2-external](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke2-internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.f5-xc-spoke2-workload](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.f5-xc-services](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc.f5-xc-spoke](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc.f5-xc-spoke2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [random_id.buildSuffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_network_acls.xc_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/network_acls) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_trust_localip"></a> [auto\_trust\_localip](#input\_auto\_trust\_localip) | if true, query ifconfig.io for public ip of terraform host. | `bool` | `false` | no |
| <a name="input_awsAz1"></a> [awsAz1](#input\_awsAz1) | Availability zone, will dynamically choose one if left empty | `string` | `null` | no |
| <a name="input_awsAz2"></a> [awsAz2](#input\_awsAz2) | Availability zone, will dynamically choose one if left empty | `string` | `null` | no |
| <a name="input_awsAz3"></a> [awsAz3](#input\_awsAz3) | Availability zone, will dynamically choose one if left empty | `string` | `null` | no |
| <a name="input_awsRegion"></a> [awsRegion](#input\_awsRegion) | aws region | `string` | n/a | yes |
| <a name="input_buildSuffix"></a> [buildSuffix](#input\_buildSuffix) | random build suffix for resources | `string` | `null` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The DNS domain name that will be used as common parent generated DNS name of loadbalancers. | `string` | `"shared.example.internal"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Volterra application namespace | `string` | n/a | yes |
| <a name="input_projectPrefix"></a> [projectPrefix](#input\_projectPrefix) | projectPrefix name for tagging | `string` | n/a | yes |
| <a name="input_servicesVpc"></a> [servicesVpc](#input\_servicesVpc) | Services VPC | `map(any)` | n/a | yes |
| <a name="input_servicesVpcCidrBlock"></a> [servicesVpcCidrBlock](#input\_servicesVpcCidrBlock) | n/a | `string` | n/a | yes |
| <a name="input_spoke2Vpc"></a> [spoke2Vpc](#input\_spoke2Vpc) | Spoke VPC | `map(any)` | n/a | yes |
| <a name="input_spoke2VpcCidrBlock"></a> [spoke2VpcCidrBlock](#input\_spoke2VpcCidrBlock) | n/a | `string` | n/a | yes |
| <a name="input_spokeVpc"></a> [spokeVpc](#input\_spokeVpc) | Spoke VPC | `map(any)` | n/a | yes |
| <a name="input_spokeVpcCidrBlock"></a> [spokeVpcCidrBlock](#input\_spokeVpcCidrBlock) | n/a | `any` | n/a | yes |
| <a name="input_trusted_ip"></a> [trusted\_ip](#input\_trusted\_ip) | IP to allow external access | `string` | n/a | yes |
| <a name="input_volterraCloudCredAWS"></a> [volterraCloudCredAWS](#input\_volterraCloudCredAWS) | Name of the volterra aws credentials | `string` | n/a | yes |
| <a name="input_volterraCloudCredAzure"></a> [volterraCloudCredAzure](#input\_volterraCloudCredAzure) | Name of the volterra aws credentials | `string` | n/a | yes |
| <a name="input_volterraP12"></a> [volterraP12](#input\_volterraP12) | Location of volterra p12 file | `string` | `null` | no |
| <a name="input_volterraTenant"></a> [volterraTenant](#input\_volterraTenant) | Tenant of Volterra | `string` | n/a | yes |
| <a name="input_volterraUrl"></a> [volterraUrl](#input\_volterraUrl) | url of volterra api | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_awsAz1"></a> [awsAz1](#output\_awsAz1) | n/a |
| <a name="output_awsAz2"></a> [awsAz2](#output\_awsAz2) | n/a |
| <a name="output_awsAz3"></a> [awsAz3](#output\_awsAz3) | n/a |
| <a name="output_awsRegion"></a> [awsRegion](#output\_awsRegion) | n/a |
| <a name="output_externalSubnets"></a> [externalSubnets](#output\_externalSubnets) | n/a |
| <a name="output_internalSubnets"></a> [internalSubnets](#output\_internalSubnets) | n/a |
| <a name="output_projectPrefix"></a> [projectPrefix](#output\_projectPrefix) | n/a |
| <a name="output_securityGroup"></a> [securityGroup](#output\_securityGroup) | n/a |
| <a name="output_serviceCidrBlock"></a> [serviceCidrBlock](#output\_serviceCidrBlock) | n/a |
| <a name="output_serviceExternalRouteTable"></a> [serviceExternalRouteTable](#output\_serviceExternalRouteTable) | n/a |
| <a name="output_spoke2ExternalSubnets"></a> [spoke2ExternalSubnets](#output\_spoke2ExternalSubnets) | n/a |
| <a name="output_spoke2SecurityGroup"></a> [spoke2SecurityGroup](#output\_spoke2SecurityGroup) | n/a |
| <a name="output_spoke2VpcId"></a> [spoke2VpcId](#output\_spoke2VpcId) | n/a |
| <a name="output_spoke2WorkloadSubnets"></a> [spoke2WorkloadSubnets](#output\_spoke2WorkloadSubnets) | n/a |
| <a name="output_spokeExternalSubnets"></a> [spokeExternalSubnets](#output\_spokeExternalSubnets) | n/a |
| <a name="output_spokeSecurityGroup"></a> [spokeSecurityGroup](#output\_spokeSecurityGroup) | n/a |
| <a name="output_spokeVpcId"></a> [spokeVpcId](#output\_spokeVpcId) | n/a |
| <a name="output_spokeWorkloadSubnets"></a> [spokeWorkloadSubnets](#output\_spokeWorkloadSubnets) | n/a |
| <a name="output_vpcId"></a> [vpcId](#output\_vpcId) | n/a |
| <a name="output_workloadSubnets"></a> [workloadSubnets](#output\_workloadSubnets) | n/a |
<!-- END_TF_DOCS -->