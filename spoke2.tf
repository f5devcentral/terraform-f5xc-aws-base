
resource "aws_vpc" "f5-xc-spoke2" {
  cidr_block           = var.spoke2VpcCidrBlock
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  #enable_classiclink   = "false"

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-vpc"
    Owner = var.resourceOwner
  }
}

resource "aws_subnet" "f5-xc-spoke2-external" {
  vpc_id                  = aws_vpc.f5-xc-spoke2.id
  for_each                = var.spoke2Vpc.external
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = "true"
  availability_zone       = var.spoke2Vpc.azs[each.key]["az"]

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-external-${each.key}"
    Owner = var.resourceOwner
  }
}

resource "aws_subnet" "f5-xc-spoke2-internal" {
  vpc_id                  = aws_vpc.f5-xc-spoke2.id
  for_each                = var.spoke2Vpc.internal
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = "false"
  availability_zone       = var.spoke2Vpc.azs[each.key]["az"]

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-internal-${each.key}"
    Owner = var.resourceOwner
  }
}

resource "aws_subnet" "f5-xc-spoke2-workload" {
  vpc_id                  = aws_vpc.f5-xc-spoke2.id
  for_each                = var.spoke2Vpc.workload
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = "false"
  availability_zone       = var.spoke2Vpc.azs[each.key]["az"]

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-workload-${each.key}"
    Owner = var.resourceOwner
  }
}

resource "aws_internet_gateway" "f5-xc-spoke2-vpc-gw" {
  vpc_id = aws_vpc.f5-xc-spoke2.id

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-vpc-igw"
    Owner = var.resourceOwner
  }
}

resource "aws_route_table" "f5-xc-spoke2-vpc-external-rt" {
  vpc_id = aws_vpc.f5-xc-spoke2.id

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-external-rt"
    Owner = var.resourceOwner
  }
}

resource "aws_route" "spoke2-internet-rt" {
  route_table_id         = aws_route_table.f5-xc-spoke2-vpc-external-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.f5-xc-spoke2-vpc-gw.id
  depends_on             = [aws_route_table.f5-xc-spoke2-vpc-external-rt]
}

resource "aws_route_table_association" "f5-xc-spoke2-external-association" {
  for_each       = aws_subnet.f5-xc-spoke2-external
  subnet_id      = each.value.id
  route_table_id = aws_route_table.f5-xc-spoke2-vpc-external-rt.id
}

resource "aws_eip" "f5-xc-spoke2-nat" {
  vpc = true

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-nat-eip"
    Owner = var.resourceOwner
  }
}

resource "aws_nat_gateway" "f5-xc-spoke2-vpc-nat" {
  allocation_id = aws_eip.f5-xc-spoke2-nat.id
  subnet_id     = aws_subnet.f5-xc-spoke2-external["az1"].id
  depends_on    = [aws_internet_gateway.f5-xc-spoke2-vpc-gw]

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-nat"
    Owner = var.resourceOwner
  }
}

resource "aws_route_table" "f5-xc-spoke2-vpc-workload-rt" {
  vpc_id = aws_vpc.f5-xc-spoke2.id

  tags = {
    Name  = "${var.projectPrefix}-f5-xc-spoke2-workload-rt"
    Owner = var.resourceOwner
  }
}

resource "aws_route" "spoke2-workload-rt" {
  route_table_id         = aws_route_table.f5-xc-spoke2-vpc-workload-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.f5-xc-spoke2-vpc-nat.id
  depends_on             = [aws_route_table.f5-xc-spoke2-vpc-workload-rt]
}

resource "aws_route_table_association" "f5-xc-spoke2-workload-association" {
  for_each       = aws_subnet.f5-xc-spoke2-workload
  subnet_id      = each.value.id
  route_table_id = aws_route_table.f5-xc-spoke2-vpc-workload-rt.id
}

resource "aws_security_group" "f5-xc-spoke2-vpc" {
  name   = "${var.projectPrefix}-f5-xc-spoke2-sg"
  vpc_id = aws_vpc.f5-xc-spoke2.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.168.0.0/16"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4500
    to_port     = 4500
    protocol    = "UDP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = local.trusted_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.projectPrefix}-f5-xc-spoke2-sg"
    Owner = var.resourceOwner
  }
}
