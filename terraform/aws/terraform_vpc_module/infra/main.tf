terraform {
  backend "s3" {
    bucket = "cloudavail-usw2-tfstate"
    key    = "terraform/infra/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source                     = "../modules/vpc"
  vpc_cidr_block             = var.vpc_cidr_block
  availability_zones         = var.availability_zones
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  nat_subnet_cidr_blocks     = var.nat_subnet_cidr_blocks
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  additional_tags            = var.additional_tags
}
