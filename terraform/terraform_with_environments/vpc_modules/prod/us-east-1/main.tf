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
  source              = "../../modules/vpc"
  vpc_cidr_block      = "${var.vpc_cidr_block}"
  aws_region          = "${var.aws_region}"
  environment         = "${var.environment}"
  private_subnet_cidr = ["10.80.18.0/24", "10.80.19.0/24", "10.80.20.0/24", "10.80.21.0/24", "10.80.22.0/24", "10.80.23.0/24"]
  nat_subnet_cidr     = ["10.80.6.0/25", "10.80.8.0/25", "10.80.10.0/25", "10.80.12.0/25", "10.80.14.0/25", "10.80.16.0/25"]
  public_subnet_cidr  = ["10.80.0.0/24", "10.80.1.0/24", "10.80.2.0/24", "10.80.3.0/24", "10.80.4.0/24", "10.80.5.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}
