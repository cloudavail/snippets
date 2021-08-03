data "aws_region" "current" {
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    var.additional_tags,
    {
      Name = "vpc"
    },
  )
}

resource "aws_eip" "nat_eip" {
  vpc = "true"
  tags = merge(
    var.additional_tags,
    {
      Name = "nat-eip"
    },
  )
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.additional_tags,
    {
      Name = "internet-gateway"
    },
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnets.*.id, 0)
  tags = merge(
    var.additional_tags,
    {
      Name = "nat-gateway"
    },
  )
}

resource "aws_route" "nat_subnets_to_nat_gateway_subnets" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
  route_table_id         = aws_route_table.nat_subnets_route_table.id
}

resource "aws_route" "public_subnet_to_internet_gateway_route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.public_subnets_route_table.id
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table" "nat_subnets_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.additional_tags,
    {
      Name = "nat-subnets-route-table"
    },
  )
}

resource "aws_route_table" "private_subnets_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.additional_tags,
    {
      Name = "private-subnets-route-table"
    },
  )
}

resource "aws_route_table" "public_subnets_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.additional_tags,
    {
      Name = "public-subnets-route-table"
    },
  )
}

resource "aws_route_table_association" "nat_subnets_route_table_association" {
  count          = length(var.nat_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.nat_subnets.*.id, count.index)
  route_table_id = aws_route_table.nat_subnets_route_table.id
}

resource "aws_route_table_association" "private_subnets_route_table_association" {
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_subnets_route_table.id
}

resource "aws_route_table_association" "public_subnets_route_table_association" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_subnets_route_table.id
}

resource "aws_subnet" "nat_subnets" {
  count             = length(var.nat_subnet_cidr_blocks)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.nat_subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = merge(
    var.additional_tags,
    {
      Name = "nat-subnet-${count.index}"
    },
  )
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = element(var.private_subnet_cidr_blocks, count.index)
  tags = merge(
    var.additional_tags,
    {
      Name = "private-subnet-${count.index}"
    },
  )
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidr_blocks)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = element(var.public_subnet_cidr_blocks, count.index)
  tags = merge(
    var.additional_tags,
    {
      Name = "public-subnet-${count.index}"
    },
  )
}
