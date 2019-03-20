terraform {
  backend "s3" {
    bucket = "cloudavail-terraform-test-east"
    key    = "us-east-1/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "cloudavail"
  region  = "us-east-1"
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
    Name = "PublicSubnet01-dev"
  }
}

resource "aws_subnet" "Public02-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "PublicSubnet02-dev"
  }
}

resource "aws_subnet" "Public03-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "PublicSubnet03-dev"
  }
}

resource "aws_subnet" "Public04-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "PublicSubnet04-dev"
  }
}

resource "aws_subnet" "Public05-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 4)}"
  availability_zone = "${element(var.availability_zones, 4)}"

  tags = {
    Name = "PublicSubnet05-dev"
  }
}

resource "aws_subnet" "Public06-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 5)}"
  availability_zone = "${element(var.availability_zones, 5)}"

  tags = {
    Name = "PublicSubnet06-dev"
  }
}

resource "aws_subnet" "Private01-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "PrivateSubnet01-dev"
  }
}

resource "aws_subnet" "Private02-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "PrivateSubnet02-dev"
  }
}

resource "aws_subnet" "Private03-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "PrivateSubnet03-dev"
  }
}

resource "aws_subnet" "Private04-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "PrivateSubnet04-dev"
  }
}

resource "aws_subnet" "Private05-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 4)}"
  availability_zone = "${element(var.availability_zones, 4)}"

  tags = {
    Name = "PrivateSubnet05-dev"
  }
}

resource "aws_subnet" "Private06-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 5)}"
  availability_zone = "${element(var.availability_zones, 5)}"

  tags = {
    Name = "PrivateSubnet06-dev"
  }
}

resource "aws_subnet" "NAT01-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

  tags = {
    Name = "NATSubnet01-dev"
  }
}

resource "aws_subnet" "NAT02-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

  tags = {
    Name = "NATSubnet02-dev"
  }
}

resource "aws_subnet" "NAT03-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

  tags = {
    Name = "NATSubnet03-dev"
  }
}

resource "aws_subnet" "NAT04-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

  tags = {
    Name = "NATSubnet04-dev"
  }
}

resource "aws_subnet" "NAT05-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 4)}"
  availability_zone = "${element(var.availability_zones, 4)}"

  tags = {
    Name = "NATSubnet05-dev"
  }
}

resource "aws_subnet" "NAT06-dev" {
  vpc_id            = "${aws_vpc.cloudavail-dev.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 5)}"
  availability_zone = "${element(var.availability_zones, 5)}"

  tags = {
    Name = "NATSubnet06-dev"
  }
}

resource "aws_internet_gateway" "gw-dev" {
  vpc_id = "${aws_vpc.cloudavail-dev.id}"

  tags = {
    Name = "cloudavail-dev"
  }
}

resource "aws_nat_gateway" "NATgw-dev" {
  allocation_id = "${aws_eip.nat-dev.id}"
  subnet_id     = "${aws_subnet.Public01-dev.id}"

  tags = {
    Name = "gw NAT-dev"
  }
}

resource "aws_route_table" "PublicRoute-dev" {
  vpc_id = "${aws_vpc.cloudavail-dev.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw-dev.id}"
  }

  tags = {
    Name = "PublicRoute-dev"
  }
}

resource "aws_route_table" "PrivateRoute-dev" {
  vpc_id = "${aws_vpc.cloudavail-dev.id}"

  tags = {
    Name = "PrivateRoute-dev"
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

resource "aws_route_table_association" "Public05-dev" {
  subnet_id      = "${aws_subnet.Public05-dev.id}"
  route_table_id = "${aws_route_table.PublicRoute-dev.id}"
}

resource "aws_route_table_association" "Public06-dev" {
  subnet_id      = "${aws_subnet.Public06-dev.id}"
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

resource "aws_route_table_association" "Private05-dev" {
  subnet_id      = "${aws_subnet.Private05-dev.id}"
  route_table_id = "${aws_route_table.PrivateRoute-dev.id}"
}

resource "aws_route_table_association" "Private06-dev" {
  subnet_id      = "${aws_subnet.Private06-dev.id}"
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

resource "aws_route_table_association" "NAT05-dev" {
  subnet_id      = "${aws_subnet.NAT05-dev.id}"
  route_table_id = "${aws_route_table.NATRoute-dev.id}"
}

resource "aws_route_table_association" "NAT06-dev" {
  subnet_id      = "${aws_subnet.NAT06-dev.id}"
  route_table_id = "${aws_route_table.NATRoute-dev.id}"
}