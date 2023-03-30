############################ VPC Peering ############################

resource "aws_vpc_peering_connection" "hubSpoke1" {
  peer_vpc_id = aws_vpc.f5-xc-spoke.id
  vpc_id      = aws_vpc.f5-xc-services.id
  auto_accept = true

  tags = {
    Name  = "${var.project_prefix}-hub-to-spoke1"
    Owner = var.resource_owner
  }
}

resource "aws_vpc_peering_connection" "hubSpoke2" {
  peer_vpc_id = aws_vpc.f5-xc-spoke2.id
  vpc_id      = aws_vpc.f5-xc-services.id
  auto_accept = true

  tags = {
    Name  = "${var.project_prefix}-hub-to-spoke2"
    Owner = var.resource_owner
  }
}

############################ Routes ############################

resource "aws_route" "hub-to-spoke1" {
  route_table_id            = aws_route_table.f5-xc-services-vpc-external-rt.id
  destination_cidr_block    = var.spoke_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke1.id
  depends_on                = [aws_route_table.f5-xc-services-vpc-external-rt]
}

resource "aws_route" "hub-to-spoke2" {
  route_table_id            = aws_route_table.f5-xc-services-vpc-external-rt.id
  destination_cidr_block    = var.spoke2_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke2.id
  depends_on                = [aws_route_table.f5-xc-services-vpc-external-rt]
}

resource "aws_route" "spoke1-external-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke-vpc-external-rt.id
  destination_cidr_block    = var.services_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke1.id
  depends_on                = [aws_route_table.f5-xc-spoke-vpc-external-rt]
}

resource "aws_route" "spoke1-workload-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke-vpc-workload-rt.id
  destination_cidr_block    = var.services_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke1.id
  depends_on                = [aws_route_table.f5-xc-spoke-vpc-workload-rt]
}

resource "aws_route" "spoke2-external-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke2-vpc-external-rt.id
  destination_cidr_block    = var.services_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke2.id
  depends_on                = [aws_route_table.f5-xc-spoke2-vpc-external-rt]
}

resource "aws_route" "spoke2-workload-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke2-vpc-workload-rt.id
  destination_cidr_block    = var.services_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke2.id
  depends_on                = [aws_route_table.f5-xc-spoke2-vpc-workload-rt]
}
