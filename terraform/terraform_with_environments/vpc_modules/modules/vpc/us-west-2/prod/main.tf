terraform {
  backend "s3" {
    bucket = "cloudavail-terraform-test-west"
    key    = "us-west-2/prod/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  profile = "cloudavail"
  region  = "us-west-2"
}

resource "aws_vpc" "cloudavail-prod" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "cloudavail-${var.environment}"
  }
}

resource "aws_eip" "nat-prod" {
  vpc = "true"
}

resource "aws_subnet" "Public01-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "PublicSubnet01-${var.environment}"
  }
}

resource "aws_subnet" "Public02-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "PublicSubnet02-${var.environment}"
  }
}

resource "aws_subnet" "Public03-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "PublicSubnet03-${var.environment}"
  }
}

resource "aws_subnet" "Public04-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "PublicSubnet04-${var.environment}"
  }
}

resource "aws_subnet" "Private01-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "PrivateSubnet01-${var.environment}"
  }
}

resource "aws_subnet" "Private02-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "PrivateSubnet02-${var.environment}"
  }
}

resource "aws_subnet" "Private03-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "PrivateSubnet03-${var.environment}"
  }
}

resource "aws_subnet" "Private04-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "PrivateSubnet04-${var.environment}"
  }
}

resource "aws_subnet" "NAT01-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "NATSubnet01-${var.environment}"
  }
}

resource "aws_subnet" "NAT02-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "NATSubnet02-${var.environment}"
  }
}

resource "aws_subnet" "NAT03-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "NATSubnet03-${var.environment}"
  }
}

resource "aws_subnet" "NAT04-prod" {
  vpc_id            = "${aws_vpc.cloudavail-prod.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "NATSubnet04-${var.environment}"
  }
}

resource "aws_internet_gateway" "gw-prod" {
  vpc_id = "${aws_vpc.cloudavail-prod.id}"

  tags = {
    Name = "cloudavail-${var.environment}"
  }
}

resource "aws_nat_gateway" "NATgw-prod" {
  allocation_id = "${aws_eip.nat-prod.id}"
  subnet_id     = "${aws_subnet.Public01-prod.id}"

  tags = {
    Name = "gw NAT-${var.environment}"
  }
}

resource "aws_route_table" "PublicRoute-prod" {
  vpc_id = "${aws_vpc.cloudavail-prod.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw-prod.id}"
  }

  tags = {
    Name = "PublicRoute-${var.environment}"
  }
}

resource "aws_route_table" "PrivateRoute-prod" {
  vpc_id = "${aws_vpc.cloudavail-prod.id}"

  tags = {
    Name = "PrivateRoute-${var.environment}"
  }
}

resource "aws_route_table" "NATRoute-prod" {
  vpc_id = "${aws_vpc.cloudavail-prod.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATgw-prod.id}"
  }

  tags = {
    Name = "NATRoute-${var.environment}"
  }
}

resource "aws_route_table_association" "Public01-prod" {
  subnet_id      = "${aws_subnet.Public01-prod.id}"
  route_table_id = "${aws_route_table.PublicRoute-prod.id}"
}

resource "aws_route_table_association" "Public02-prod" {
  subnet_id      = "${aws_subnet.Public02-prod.id}"
  route_table_id = "${aws_route_table.PublicRoute-prod.id}"
}

resource "aws_route_table_association" "Public03-prod" {
  subnet_id      = "${aws_subnet.Public03-prod.id}"
  route_table_id = "${aws_route_table.PublicRoute-prod.id}"
}

resource "aws_route_table_association" "Public04-prod" {
  subnet_id      = "${aws_subnet.Public04-prod.id}"
  route_table_id = "${aws_route_table.PublicRoute-prod.id}"
}

resource "aws_route_table_association" "Private01-prod" {
  subnet_id      = "${aws_subnet.Private01-prod.id}"
  route_table_id = "${aws_route_table.PrivateRoute-prod.id}"
}

resource "aws_route_table_association" "Private02-prod" {
  subnet_id      = "${aws_subnet.Private02-prod.id}"
  route_table_id = "${aws_route_table.PrivateRoute-prod.id}"
}

resource "aws_route_table_association" "Private03-prod" {
  subnet_id      = "${aws_subnet.Private03-prod.id}"
  route_table_id = "${aws_route_table.PrivateRoute-prod.id}"
}

resource "aws_route_table_association" "Private04-prod" {
  subnet_id      = "${aws_subnet.Private04-prod.id}"
  route_table_id = "${aws_route_table.PrivateRoute-prod.id}"
}

resource "aws_route_table_association" "NAT01-prod" {
  subnet_id      = "${aws_subnet.NAT01-prod.id}"
  route_table_id = "${aws_route_table.NATRoute-prod.id}"
}

resource "aws_route_table_association" "NAT02-prod" {
  subnet_id      = "${aws_subnet.NAT02-prod.id}"
  route_table_id = "${aws_route_table.NATRoute-prod.id}"
}

resource "aws_route_table_association" "NAT03-prod" {
  subnet_id      = "${aws_subnet.NAT03-prod.id}"
  route_table_id = "${aws_route_table.NATRoute-prod.id}"
}

resource "aws_route_table_association" "NAT04-prod" {
  subnet_id      = "${aws_subnet.NAT04-prod.id}"
  route_table_id = "${aws_route_table.NATRoute-prod.id}"
}
