terraform {
  backend "s3" {
    bucket = "cloudavail-terraform-test-west"
    key    = "us-west-2/dev/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  profile = "cloudavail"
  region  = "us-west-2"
}

resource "aws_vpc" "cloudavail-dev" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "cloudavail-${var.environment}"
  }
}

resource "aws_eip" "nat-dev" {
  vpc = "true"
}

resource "aws_subnet" "Public01-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "PublicSubnet01-${var.environment}"
  }
}

resource "aws_subnet" "Public02-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "PublicSubnet02-${var.environment}"
  }
}

resource "aws_subnet" "Public03-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "PublicSubnet03-${var.environment}"
  }
}

resource "aws_subnet" "Public04-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "PublicSubnet04-${var.environment}"
  }
}

resource "aws_subnet" "Private01-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "PrivateSubnet01-${var.environment}"
  }
}

resource "aws_subnet" "Private02-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "PrivateSubnet02-${var.environment}"
  }
}

resource "aws_subnet" "Private03-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "PrivateSubnet03-${var.environment}"
  }
}

resource "aws_subnet" "Private04-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "PrivateSubnet04-${var.environment}"
  }
}

resource "aws_subnet" "NAT01-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "NATSubnet01-${var.environment}"
  }
}

resource "aws_subnet" "NAT02-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "NATSubnet02-${var.environment}"
  }
}

resource "aws_subnet" "NAT03-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "NATSubnet03-${var.environment}"
  }
}

resource "aws_subnet" "NAT04-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "NATSubnet04-${var.environment}"
  }
}

resource "aws_internet_gateway" "gw-dev" {
  vpc_id = "${aws_vpc.cloudavail-dev.id}"

  tags = {
    Name = "cloudavail-${var.environment}"
  }
}

resource "aws_nat_gateway" "NATgw-dev" {
  allocation_id = "${aws_eip.nat-dev.id}"
  subnet_id     = "${aws_subnet.Public01-dev.id}"

  tags = {
    Name = "gw NAT-${var.environment}"
  }
}

resource "aws_route_table" "PublicRoute-dev" {
  vpc_id = "${aws_vpc.cloudavail-dev.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw-dev.id}"
  }

  tags = {
    Name = "PublicRoute-${var.environment}"
  }
}

resource "aws_route_table" "PrivateRoute-dev" {
  vpc_id = "${aws_vpc.cloudavail-dev.id}"

  tags = {
    Name = "PrivateRoute-${var.environment}"
  }
}

resource "aws_route_table" "NATRoute-dev" {
  vpc_id = "${aws_vpc.cloudavail-dev.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATgw-dev.id}"
  }

  tags = {
    Name = "NATRoute-${var.environment}"
  }
}

resource "aws_route_table_association" "Public01-dev" {
  subnet_id      = "${aws_subnet.Public01-dev.id}"
  route_table_id = "${aws_route_table.PublicRoute-dev.id}"
}

resource "aws_route_table_association" "Public02-dev" {
  subnet_id      = "${aws_subnet.Public02-dev.id}"
  route_table_id = "${aws_route_table.PublicRoute-dev.id}"
}

resource "aws_route_table_association" "Public03-dev" {
  subnet_id      = "${aws_subnet.Public03-dev.id}"
  route_table_id = "${aws_route_table.PublicRoute-dev.id}"
}

resource "aws_route_table_association" "Public04-dev" {
  subnet_id      = "${aws_subnet.Public04-dev.id}"
  route_table_id = "${aws_route_table.PublicRoute-dev.id}"
}

resource "aws_route_table_association" "Private01-dev" {
  subnet_id      = "${aws_subnet.Private01-dev.id}"
  route_table_id = "${aws_route_table.PrivateRoute-dev.id}"
}

resource "aws_route_table_association" "Private02-dev" {
  subnet_id      = "${aws_subnet.Private02-dev.id}"
  route_table_id = "${aws_route_table.PrivateRoute-dev.id}"
}

resource "aws_route_table_association" "Private03-dev" {
  subnet_id      = "${aws_subnet.Private03-dev.id}"
  route_table_id = "${aws_route_table.PrivateRoute-dev.id}"
}

resource "aws_route_table_association" "Private04-dev" {
  subnet_id      = "${aws_subnet.Private04-dev.id}"
  route_table_id = "${aws_route_table.PrivateRoute-dev.id}"
}

resource "aws_route_table_association" "NAT01-dev" {
  subnet_id      = "${aws_subnet.NAT01-dev.id}"
  route_table_id = "${aws_route_table.NATRoute-dev.id}"
}

resource "aws_route_table_association" "NAT02-dev" {
  subnet_id      = "${aws_subnet.NAT02-dev.id}"
  route_table_id = "${aws_route_table.NATRoute-dev.id}"
}

resource "aws_route_table_association" "NAT03-dev" {
  subnet_id      = "${aws_subnet.NAT03-dev.id}"
  route_table_id = "${aws_route_table.NATRoute-dev.id}"
}

resource "aws_route_table_association" "NAT04-dev" {
  subnet_id      = "${aws_subnet.NAT04-dev.id}"
  route_table_id = "${aws_route_table.NATRoute-dev.id}"
}
