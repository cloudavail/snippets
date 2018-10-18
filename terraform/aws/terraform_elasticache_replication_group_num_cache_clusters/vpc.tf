# Resources
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "private_subnet_01" {
  cidr_block = "10.0.0.0/25"
  vpc_id     = "${aws_vpc.vpc.id}"
}

resource "aws_subnet" "private_subnet_02" {
  cidr_block = "10.0.0.128/25"
  vpc_id     = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "private_aws_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table_association" "private_subnet_01_route_table_association" {
  route_table_id = "${aws_route_table.private_aws_route_table.id}"
  subnet_id      = "${aws_subnet.private_subnet_01.id}"
}

resource "aws_route_table_association" "private_subnet_02_route_table_association" {
  route_table_id = "${aws_route_table.private_aws_route_table.id}"
  subnet_id      = "${aws_subnet.private_subnet_02.id}"
}
