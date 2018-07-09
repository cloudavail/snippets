# Variables
# variables are named "resource_name_property_name"
variable "terraform_test_vpc_cidr_block" {
  description = "The CIDR Block to be used as the Terraform Test VPC CIDR Block Property"
}

variable "terraform_test_vpc_name" {
  description = "The Name to be used as the Terraform Test VPC CIDR Block Property"
}

variable "terraform_test_subnet01_cidr_block" {
  description = "The CIDR Block to be used as the Terraform Test Subnet 01 CIDR Block Property"
}

variable "terraform_test_subnet02_cidr_block" {
  description = "The CIDR Block to be used as the Terraform Test Subnet 02 CIDR Block Property"
}

# Resources
resource "aws_vpc" "terraform_test_vpc" {
  cidr_block = "${var.terraform_test_vpc_cidr_block}"
  tags {
    Name = "${var.terraform_test_vpc_name}"
  }
}

resource "aws_subnet" "terraform_test_subnet01" {
  vpc_id     = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.terraform_test_subnet01_cidr_block}"
}

resource "aws_subnet" "terraform_test_subnet02" {
  vpc_id     = "${aws_vpc.terraform_test_vpc.id}"
  cidr_block = "${var.terraform_test_subnet02_cidr_block}"
}
