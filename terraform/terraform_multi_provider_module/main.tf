provider "aws" {
  alias   = "cloudavail_prod"
  region  = "us-west-2"
  profile = "cloudavail-prod"
}

provider "aws" {
  alias   = "cloudavail_dev"
  region = "us-west-2"
  profile = "cloudavail-dev"
}

module "s3" {
  source    = "./modules/s3"
  # the command below passes the providers into the child module
  providers = {
    cloudavail_dev  = "aws.cloudavail_dev"
    cloudavail_prod = "aws.cloudavail_prod"
  }
}
