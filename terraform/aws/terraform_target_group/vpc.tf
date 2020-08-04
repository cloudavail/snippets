# Resources
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "publicsubnet01" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/25"
}

resource "aws_subnet" "publicsubnet02" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.128/25"
}
