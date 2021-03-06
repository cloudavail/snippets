# s3 bucket should reflect region "east/west"
# s3 bucket key should reflect environment "dev/prod"
terraform {
  backend "s3" {
    bucket = "cloudavail-terraform-test-east"
    key    = "us-east-1/prod/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "cloudavail"
  region  = "${var.aws_region}"
}

module "vpc" {
  source             = "../../modules/vpc"
  vpc_cidr_block     = "${var.vpc_cidr_block}"
  aws_region         = "${var.aws_region}"
  environment        = "${var.environment}"
  private_subnets    = "${var.private_subnets}"
  nat_subnets        = "${var.nat_subnets}"
  public_subnets     = "${var.public_subnets}"
  availability_zones = "${var.availability_zones}"
}
