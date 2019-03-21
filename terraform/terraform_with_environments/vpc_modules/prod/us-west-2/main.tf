# s3 bucket should reflect region "east/west"
# s3 bucket key should reflect environment "dev/prod"

terraform {
  backend "s3" {
    bucket = "cloudavail-terraform-test-west"
    key    = "us-west-2/prod/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  profile = "cloudavail"
  region  = "${var.aws_region}"
}

module "vpc" {
  source              = "../../modules/vpc"
  vpc_cidr_block      = "${var.vpc_cidr_block}"
  aws_region          = "${var.aws_region}"
  environment         = "${var.environment}"
  private_subnet_cidr = ["10.30.12.0/24", "10.30.13.0/24", "10.30.14.0/24", "10.30.15.0/24"]
  nat_subnet_cidr     = ["10.30.4.0/25", "10.30.6.0/25", "10.30.8.0/25", "10.30.10.0/25"]
  public_subnet_cidr  = ["10.30.0.0/24", "10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
  availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}
