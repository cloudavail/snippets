provider "aws" {
  profile = "cloudavail"
  region  = "us-west-2"
}

module "vpc-prod" {
  source = "./modules/vpc/us-west-2/prod"
}

module "vpc-dev" {
  source = "./modules/vpc/us-west-2/dev"
}
