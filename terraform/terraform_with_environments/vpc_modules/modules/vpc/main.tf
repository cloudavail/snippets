resource "aws_eip" "nat" {
  vpc = "true"

  tags = {
    Name = "${var.environment}"
  }
}

resource "aws_vpc" "cloudavail" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "cloudavail-${var.environment}"
  }
}

resource "aws_subnet" "public" {
  count = "${length(var.public_subnets)}"

  vpc_id            = "${aws_vpc.cloudavail.id}"
  cidr_block        = "${element(var.public_subnets, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "PublicSubnet-${element(var.az_count, count.index)}"
  }
}

resource "aws_subnet" "private" {
  count = "${length(var.public_subnets)}"

  vpc_id            = "${aws_vpc.cloudavail.id}"
  cidr_block        = "${element(var.private_subnets, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "PrivateSubnet-${element(var.az_count, count.index)}"
  }
}

resource "aws_subnet" "nat" {
  count = "${length(var.nat_subnets)}"

  vpc_id            = "${aws_vpc.cloudavail.id}"
  cidr_block        = "${element(var.nat_subnets, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "NATSubnet-${element(var.az_count, count.index)}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.cloudavail.id}"

  tags = {
    Name = "cloudavail-gw-${var.environment}"
  }
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${element(aws_subnet.public.*.id,0)}"

  tags = {
    Name = "NAT-gw-${var.environment}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.cloudavail.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "PublicRoute-${var.environment}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.cloudavail.id}"

  tags = {
    Name = "PrivateRoute-${var.environment}"
  }
}

resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.cloudavail.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATgw.id}"
  }

  tags = {
    Name = "NATRoute-${var.environment}"
  }
}

resource "aws_route_table_association" "public" {
  count = "${length(var.public_subnets)}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  count = "${length(var.private_subnets)}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "nat" {
  count = "${length(var.nat_subnets)}"

  subnet_id      = "${element(aws_subnet.nat.*.id, count.index)}"
  route_table_id = "${aws_route_table.nat.id}"
}
