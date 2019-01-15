provider "aws" {
  region = "us-west-2"
}

# Resources
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "publicsubnet01" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.0.0/25"
}

resource "aws_subnet" "publicsubnet02" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.0.128/25"
}

resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "public_aws_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table_association" "route_table_association_01" {
  subnet_id      = "${aws_subnet.publicsubnet01.id}"
  route_table_id = "${aws_route_table.public_aws_route_table.id}"
}

resource "aws_route_table_association" "route_table_association_02" {
  subnet_id      = "${aws_subnet.publicsubnet02.id}"
  route_table_id = "${aws_route_table.public_aws_route_table.id}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public_aws_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.aws_internet_gateway.id}"
}

resource "aws_security_group" "gitlab_runner_security_group" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id      = "${aws_vpc.vpc.id}"

}

data "template_file" "gitlab_runner_user_data" {
  template = "${file("templates/gitlab_runner.sh")}"
  vars {
    gitlab_runner_registration_token = "${var.gitlab_runner_registration_token}"
  }
}

resource "aws_launch_template" "gitlab_runner_template" {
  # image_id lookup is available here: https://cloud-images.ubuntu.com/locator/ec2/
  # search on: bionic hvm:ebs-ssd
  name_prefix                 = "gitlab_runner"
  image_id                    = "ami-0f05ad41860678734"
  instance_type               = "t3.micro"
  key_name                    = "cloudavail-gitlab-runner"
  user_data                   = "${base64encode(data.template_file.gitlab_runner_user_data.rendered)}"
  # used to create a new launch configuration prior to destroying previous
  # avoids error ResourceInUse: Cannot delete launch configuration terraform-${var} because it is attached to AutoScalingGroup $asg_name
  lifecycle {
    create_before_destroy     = true
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [ "${aws_security_group.gitlab_runner_security_group.id}" ]
  }
}

resource "aws_autoscaling_group" "gitlab_runner_auto_scaling_group" {
  desired_capacity    = 1
  min_size            = 1
  max_size            = 1
  vpc_zone_identifier = [ "${aws_subnet.publicsubnet01.id}", "${aws_subnet.publicsubnet02.id}" ]
  launch_template {
    id      = "${aws_launch_template.gitlab_runner_template.id}"
    # note: I've seen version = "$$Latest" and while this is clear what is intended
    # I prefer the consistency of aws_launch_template.gitlab_runner_template.latest_version
    version = "${aws_launch_template.gitlab_runner_template.latest_version}"
  }
}
