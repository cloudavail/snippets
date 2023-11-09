resource "aws_vpc_endpoint" "s3_vpc_endpoint" {
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_id       = aws_vpc.vpc.id
  tags = merge(
    var.additional_tags,
    {
      Name = "s3-vpc-endpoint"
    },
  )
}

resource "aws_vpc_endpoint_route_table_association" "nat_s3_vpc_endpoint_route_table_associationt" {
  route_table_id  = aws_route_table.nat_subnets_route_table.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_vpc_endpoint.id
}

resource "aws_vpc_endpoint_route_table_association" "private_s3_vpc_endpoint_route_table_association" {
  route_table_id  = aws_route_table.private_subnets_route_table.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_vpc_endpoint.id
}

resource "aws_vpc_endpoint_route_table_association" "public_s3_vpc_endpoint_route_table_association" {
  route_table_id  = aws_route_table.public_subnets_route_table.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_vpc_endpoint.id
}
