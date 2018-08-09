provider "aws" {
  region = "us-west-2"
}

# Resources
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "publicsubnet01" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "public_aws_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.publicsubnet01.id}"
  route_table_id = "${aws_route_table.public_aws_route_table.id}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public_aws_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.aws_internet_gateway.id}"
}

resource "aws_security_group" "large_disk_launch_security_group" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id      = "${aws_vpc.vpc.id}"

}

resource "aws_launch_configuration" "large_disk_launch_template" {
# https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html
  associate_public_ip_address = true
  image_id                    = "ami-0ea01e1d1dea65b5c"
  instance_type               = "t2.micro"
  key_name                    = "large_disk_testing"
  security_groups             = [ "${aws_security_group.large_disk_launch_security_group.id}" ]
  root_block_device {
    delete_on_termination     = true
    volume_size               = 40
    volume_type               = "gp2"
  }
  # used to create a new launch configuration prior to destroying previous
  # avoids error ResourceInUse: Cannot delete launch configuration terraform-${var} because it is attached to AutoScalingGroup tf-asg-${var}
  lifecycle {
    create_before_destroy     = true
  }
}

resource "aws_autoscaling_group" "large_disk_launch_auto_scaling_group" {
  launch_configuration = "${aws_launch_configuration.large_disk_launch_template.name}"
  min_size             = 1
  max_size             = 1
  vpc_zone_identifier  = [ "${aws_subnet.publicsubnet01.id}" ]
}
