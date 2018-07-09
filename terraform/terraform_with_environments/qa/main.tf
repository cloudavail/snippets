provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  terraform_test_vpc_cidr_block = "10.0.0.0/24"
  # TODO: parameterize environment
  terraform_test_vpc_name = "terraform_test_vpc-qa"
  terraform_test_subnet01_cidr_block = "10.0.0.0/25"
  terraform_test_subnet02_cidr_block = "10.0.0.128/25"
  source = "../modules/vpc" 
}
