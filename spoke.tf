
resource "aws_vpc" "f5-xc-spoke" {
  cidr_block           = var.spoke_vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  #enable_classiclink   = "false"

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-vpc"
    Owner = var.resource_owner
  }
}

resource "aws_subnet" "f5-xc-spoke-external" {
  vpc_id                  = aws_vpc.f5-xc-spoke.id
  for_each                = var.spoke_vpc.external
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = "true"
  availability_zone       = var.spoke_vpc.azs[each.key]["az"]

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-external-${each.key}"
    Owner = var.resource_owner
  }
}

resource "aws_subnet" "f5-xc-spoke-internal" {
  vpc_id                  = aws_vpc.f5-xc-spoke.id
  for_each                = var.spoke_vpc.internal
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = "false"
  availability_zone       = var.spoke_vpc.azs[each.key]["az"]

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-internal-${each.key}"
    Owner = var.resource_owner
  }
}

resource "aws_subnet" "f5-xc-spoke-workload" {
  vpc_id                  = aws_vpc.f5-xc-spoke.id
  for_each                = var.spoke_vpc.workload
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = "false"
  availability_zone       = var.spoke_vpc.azs[each.key]["az"]

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-workload-${each.key}"
    Owner = var.resource_owner
  }
}

resource "aws_internet_gateway" "f5-xc-spoke-vpc-gw" {
  vpc_id = aws_vpc.f5-xc-spoke.id

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-vpc-igw"
    Owner = var.resource_owner
  }
}

resource "aws_route_table" "f5-xc-spoke-vpc-external-rt" {
  vpc_id = aws_vpc.f5-xc-spoke.id

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-external-rt"
    Owner = var.resource_owner
  }
}

resource "aws_route" "spoke-internet-rt" {
  route_table_id         = aws_route_table.f5-xc-spoke-vpc-external-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.f5-xc-spoke-vpc-gw.id
  depends_on             = [aws_route_table.f5-xc-spoke-vpc-external-rt]
}

resource "aws_route_table_association" "f5-xc-spoke-external-association" {
  for_each       = aws_subnet.f5-xc-spoke-external
  subnet_id      = each.value.id
  route_table_id = aws_route_table.f5-xc-spoke-vpc-external-rt.id
}

resource "aws_eip" "f5-xc-spoke-nat" {
  vpc = true

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-nat-eip"
    Owner = var.resource_owner
  }
}

resource "aws_nat_gateway" "f5-xc-spoke-vpc-nat" {
  allocation_id = aws_eip.f5-xc-spoke-nat.id
  subnet_id     = aws_subnet.f5-xc-spoke-external["az1"].id
  depends_on    = [aws_internet_gateway.f5-xc-spoke-vpc-gw]

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-nat"
    Owner = var.resource_owner
  }
}

resource "aws_route_table" "f5-xc-spoke-vpc-workload-rt" {
  vpc_id = aws_vpc.f5-xc-spoke.id

  tags = {
    Name  = "${var.project_prefix}-f5-xc-spoke-workload-rt"
    Owner = var.resource_owner
  }
}

resource "aws_route" "spoke-workload-rt" {
  route_table_id         = aws_route_table.f5-xc-spoke-vpc-workload-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.f5-xc-spoke-vpc-nat.id
  depends_on             = [aws_route_table.f5-xc-spoke-vpc-workload-rt]
}

resource "aws_route_table_association" "f5-xc-spoke-workload-association" {
  for_each       = aws_subnet.f5-xc-spoke-workload
  subnet_id      = each.value.id
  route_table_id = aws_route_table.f5-xc-spoke-vpc-workload-rt.id
}

resource "aws_security_group" "f5-xc-spoke-vpc" {
  name   = "${var.project_prefix}-f5-xc-spoke-sg"
  vpc_id = aws_vpc.f5-xc-spoke.id

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
    Name  = "${var.project_prefix}-f5-xc-spoke-sg"
    Owner = var.resource_owner
  }
}

############################ AMI ############################

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = [var.ami_search_name]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

############################ Compute ############################

resource "aws_instance" "jumphost" {
  count                  = var.create_jumphost == true ? 1 : 0
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.large"
  subnet_id              = aws_subnet.f5-xc-spoke-external["az1"].id
  vpc_security_group_ids = [aws_security_group.f5-xc-spoke-vpc.id]
  key_name               = var.ssh_key

  tags = {
    Name  = format("%s-jumphost-spoke1", var.project_prefix)
    Owner = var.resource_owner
  }
}
