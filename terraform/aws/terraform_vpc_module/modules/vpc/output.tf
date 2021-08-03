output "nat_subnets_list" {
  value = aws_subnet.nat_subnets.*.id
}

output "private_subnets_list" {
  value = aws_subnet.private_subnets.*.id
}

output "public_subnets_list" {
  value = aws_subnet.public_subnets.*.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

