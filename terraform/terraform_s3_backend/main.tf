terraform {
  backend "s3" {
    bucket = "cjohnson-terraform-test"
    key    = "terraform_s3_backend"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "terraform_test_vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "terraform_test_subnet01" {
  vpc_id     = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "10.0.0.0/25"
}

resource "aws_subnet" "terraform_test_subnet02" {
  vpc_id     = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "10.0.0.128/25"
}

resource "aws_security_group" "security_group_01" {
  name        = "security_group_01"
  description = "Security Group 01"
  vpc_id      = "${aws_vpc.terraform_test_vpc.id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # allow any "protocol and port" combination out
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}