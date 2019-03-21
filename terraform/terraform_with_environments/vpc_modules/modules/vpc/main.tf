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

  vpc_id                  = "${aws_vpc.cloudavail.id}"
  cidr_block              = "${element(concat(var.public_subnets, list("")), count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
 # map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

#  tags = "${merge(map("Name", format("%s-${var.public_subnet_suffix}-%s", var.name, element(var.azs, count.index))), var.tags, var.public_subnet_tags)}"
}

resource "aws_subnet" "private" {
  count = "${length(var.public_subnets)}"

  vpc_id                  = "${aws_vpc.cloudavail.id}"
  cidr_block              = "${element(concat(var.private_subnets, list("")), count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
 # map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

#  tags = "${merge(map("Name", format("%s-${var.public_subnet_suffix}-%s", var.name, element(var.azs, count.index))), var.tags, var.public_subnet_tags)}"
}

resource "aws_subnet" "nat" {
  count = "${length(var.nat_subnets)}"

  vpc_id                  = "${aws_vpc.cloudavail.id}"
  cidr_block              = "${element(concat(var.nat_subnets, list("")), count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
 # map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

#  tags = "${merge(map("Name", format("%s-${var.public_subnet_suffix}-%s", var.name, element(var.azs, count.index))), var.tags, var.public_subnet_tags)}"
}
# resource "aws_subnet" "Public01" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.public_subnet_cidr, 0)}"
  # availability_zone = "${element(var.availability_zones, 0)}"

  # tags = {
    # Name = "PublicSubnet01-${var.environment}"
  # }
# }

# resource "aws_subnet" "Public02" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.public_subnet_cidr, 1)}"
  # availability_zone = "${element(var.availability_zones, 1)}"

  # tags = {
    # Name = "PublicSubnet02-${var.environment}"
  # }
# }

# resource "aws_subnet" "Public03" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.public_subnet_cidr, 2)}"
  # availability_zone = "${element(var.availability_zones, 2)}"

  # tags = {
    # Name = "PublicSubnet03-${var.environment}"
  # }
# }

# resource "aws_subnet" "Public04" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.public_subnet_cidr, 3)}"
  # availability_zone = "${element(var.availability_zones, 3)}"

  # tags = {
    # Name = "PublicSubnet04-${var.environment}"
  # }
# }

# resource "aws_subnet" "Public05" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.public_subnet_cidr, 4)}"
  # availability_zone = "${element(var.availability_zones, 4)}"

  # tags = {
    # Name = "PublicSubnet05-${var.environment}"
  # }
# }

# resource "aws_subnet" "Public06" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.public_subnet_cidr, 5)}"
  # availability_zone = "${element(var.availability_zones, 5)}"

  # tags = {
    # Name = "PublicSubnet06-${var.environment}"
  # }
# }

# resource "aws_subnet" "Private01" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.private_subnet_cidr, 0)}"
  # availability_zone = "${element(var.availability_zones, 0)}"

  # tags = {
    # Name = "PrivateSubnet01-${var.environment}"
  # }
# }

# resource "aws_subnet" "Private02" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.private_subnet_cidr, 1)}"
  # availability_zone = "${element(var.availability_zones, 1)}"

  # tags = {
    # Name = "PrivateSubnet02-${var.environment}"
  # }
# }

# resource "aws_subnet" "Private03" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.private_subnet_cidr, 2)}"
  # availability_zone = "${element(var.availability_zones, 2)}"

  # tags = {
    # Name = "PrivateSubnet03-${var.environment}"
  # }
# }

# resource "aws_subnet" "Private04" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.private_subnet_cidr, 3)}"
  # availability_zone = "${element(var.availability_zones, 3)}"

  # tags = {
    # Name = "PrivateSubnet04-${var.environment}"
  # }
# }

# resource "aws_subnet" "Private05" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.private_subnet_cidr, 4)}"
  # availability_zone = "${element(var.availability_zones, 4)}"

  # tags = {
    # Name = "PrivateSubnet05-${var.environment}"
  # }
# }

# resource "aws_subnet" "Private06" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.private_subnet_cidr, 5)}"
  # availability_zone = "${element(var.availability_zones, 5)}"

  # tags = {
    # Name = "PrivateSubnet06-${var.environment}"
  # }
# }

# resource "aws_subnet" "NAT01" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.nat_subnet_cidr, 0)}"
  # availability_zone = "${element(var.availability_zones, 0)}"

  # tags = {
    # Name = "NATSubnet01-${var.environment}"
  # }
# }

# resource "aws_subnet" "NAT02" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.nat_subnet_cidr, 1)}"
  # availability_zone = "${element(var.availability_zones, 1)}"

  # tags = {
    # Name = "NATSubnet02-${var.environment}"
  # }
# }

# resource "aws_subnet" "NAT03" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.nat_subnet_cidr, 2)}"
  # availability_zone = "${element(var.availability_zones, 2)}"

  # tags = {
    # Name = "NATSubnet03-${var.environment}"
  # }
# }

# resource "aws_subnet" "NAT04" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.nat_subnet_cidr, 3)}"
  # availability_zone = "${element(var.availability_zones, 3)}"

  # tags = {
    # Name = "NATSubnet04-${var.environment}"
  # }
# }

# resource "aws_subnet" "NAT05" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.nat_subnet_cidr, 4)}"
  # availability_zone = "${element(var.availability_zones, 4)}"

  # tags = {
    # Name = "NATSubnet05-${var.environment}"
  # }
# }

# resource "aws_subnet" "NAT06" {
  # vpc_id            = "${aws_vpc.cloudavail.id}"
  # cidr_block        = "${element(var.nat_subnet_cidr, 5)}"
  # availability_zone = "${element(var.availability_zones, 5)}"

  # tags = {
    # Name = "NATSubnet06-${var.environment}"
  # }
# }

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
  count = "${length(var.public_subnets) > 0 ? length(var.public_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  count = "${length(var.private_subnets) > 0 ? length(var.private_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "nat" {
  count = "${length(var.nat_subnets) > 0 ? length(var.nat_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.nat.*.id, count.index)}"
  route_table_id = "${aws_route_table.nat.id}"
}
#
#resource "aws_route_table_association" "Public01" {
#  subnet_id      = "${aws_subnet.Public01.id}"
#  route_table_id = "${aws_route_table.PublicRoute.id}"
#}
#
#resource "aws_route_table_association" "Public02" {
#  subnet_id      = "${aws_subnet.Public02.id}"
#  route_table_id = "${aws_route_table.PublicRoute.id}"
#}
#
#resource "aws_route_table_association" "Public03" {
#  subnet_id      = "${aws_subnet.Public03.id}"
#  route_table_id = "${aws_route_table.PublicRoute.id}"
#}
#
#resource "aws_route_table_association" "Public04" {
#  subnet_id      = "${aws_subnet.Public04.id}"
#  route_table_id = "${aws_route_table.PublicRoute.id}"
#}
#
#resource "aws_route_table_association" "Public05" {
#  subnet_id      = "${aws_subnet.Public05.id}"
#  route_table_id = "${aws_route_table.PublicRoute.id}"
#}
#
#resource "aws_route_table_association" "Public06" {
#  subnet_id      = "${aws_subnet.Public06.id}"
#  route_table_id = "${aws_route_table.PublicRoute.id}"
#}
#
#resource "aws_route_table_association" "Private01" {
#  subnet_id      = "${aws_subnet.Private01.id}"
#  route_table_id = "${aws_route_table.PrivateRoute.id}"
#}
#
#resource "aws_route_table_association" "Private02" {
#  subnet_id      = "${aws_subnet.Private02.id}"
#  route_table_id = "${aws_route_table.PrivateRoute.id}"
#}
#
#resource "aws_route_table_association" "Private03" {
#  subnet_id      = "${aws_subnet.Private03.id}"
#  route_table_id = "${aws_route_table.PrivateRoute.id}"
#}
#
#resource "aws_route_table_association" "Private04" {
#  subnet_id      = "${aws_subnet.Private04.id}"
#  route_table_id = "${aws_route_table.PrivateRoute.id}"
#}
#
#resource "aws_route_table_association" "Private05" {
#  subnet_id      = "${aws_subnet.Private05.id}"
#  route_table_id = "${aws_route_table.PrivateRoute.id}"
#}
#
#resource "aws_route_table_association" "Private06" {
#  subnet_id      = "${aws_subnet.Private06.id}"
#  route_table_id = "${aws_route_table.PrivateRoute.id}"
#}
#
#resource "aws_route_table_association" "NAT01" {
#  subnet_id      = "${aws_subnet.NAT01.id}"
#  route_table_id = "${aws_route_table.NATRoute.id}"
#}
#
#resource "aws_route_table_association" "NAT02" {
#  subnet_id      = "${aws_subnet.NAT02.id}"
#  route_table_id = "${aws_route_table.NATRoute.id}"
#}
#
#resource "aws_route_table_association" "NAT03" {
#  subnet_id      = "${aws_subnet.NAT03.id}"
#  route_table_id = "${aws_route_table.NATRoute.id}"
#}
#
#resource "aws_route_table_association" "NAT04" {
#  subnet_id      = "${aws_subnet.NAT04.id}"
#  route_table_id = "${aws_route_table.NATRoute.id}"
#}
#
#resource "aws_route_table_association" "NAT05" {
#  subnet_id      = "${aws_subnet.NAT05.id}"
#  route_table_id = "${aws_route_table.NATRoute.id}"
#}
#
#resource "aws_route_table_association" "NAT06" {
#  subnet_id      = "${aws_subnet.NAT06.id}"
#  route_table_id = "${aws_route_table.NATRoute.id}"
#}
#