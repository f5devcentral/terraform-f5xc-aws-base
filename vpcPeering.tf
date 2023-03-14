############################ VPC Peering ############################

resource "aws_vpc_peering_connection" "hubSpoke1" {
  peer_vpc_id = aws_vpc.f5-xc-spoke.id
  vpc_id      = aws_vpc.f5-xc-services.id
  auto_accept = true

  tags = {
    Name  = "${var.projectPrefix}-hub-to-spoke1"
    Owner = var.resourceOwner
  }
}

resource "aws_vpc_peering_connection" "hubSpoke2" {
  peer_vpc_id = aws_vpc.f5-xc-spoke2.id
  vpc_id      = aws_vpc.f5-xc-services.id
  auto_accept = true

  tags = {
    Name  = "${var.projectPrefix}-hub-to-spoke2"
    Owner = var.resourceOwner
  }
}

############################ Routes ############################

resource "aws_default_route_table" "f5-xc-services-default-rt" {
  default_route_table_id = aws_vpc.f5-xc-services.default_route_table_id

  route {
    cidr_block                = var.spokeVpcCidrBlock
    vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke1.id
  }
  route {
    cidr_block                = var.spoke2VpcCidrBlock
    vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke2.id
  }

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-services-default-rt"
    Owner = var.resourceOwner
  }
}

resource "aws_route" "spoke1-external-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke-vpc-external-rt.id
  destination_cidr_block    = var.servicesVpcCidrBlock
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke1.id
  depends_on                = [aws_route_table.f5-xc-spoke-vpc-external-rt]
}

resource "aws_route" "spoke1-workload-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke-vpc-workload-rt.id
  destination_cidr_block    = var.servicesVpcCidrBlock
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke1.id
  depends_on                = [aws_route_table.f5-xc-spoke-vpc-workload-rt]
}

resource "aws_route" "spoke2-external-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke2-vpc-external-rt.id
  destination_cidr_block    = var.servicesVpcCidrBlock
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke2.id
  depends_on                = [aws_route_table.f5-xc-spoke2-vpc-external-rt]
}

resource "aws_route" "spoke2-workload-to-hub" {
  route_table_id            = aws_route_table.f5-xc-spoke2-vpc-workload-rt.id
  destination_cidr_block    = var.servicesVpcCidrBlock
  vpc_peering_connection_id = aws_vpc_peering_connection.hubSpoke2.id
  depends_on                = [aws_route_table.f5-xc-spoke2-vpc-workload-rt]
}
