
output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnets" {
  value = ["${aws_subnet.public.*.id}"]
}

output "private_subnets" {
  value = ["${aws_subnet.private.*.id}"]
}

output "nat_subnets" {
  value = ["${aws_subnet.nat.*.id}"]
}

output "eip" {
  value = "${aws_eip.nat.public_ip}"
}