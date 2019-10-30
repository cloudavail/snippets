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

resource "aws_s3_bucket" "cloudavail_dev_bucket" {
  provider = "aws.cloudavail_dev"
  bucket = "cloudavail-dev-bucket"
}

resource "aws_s3_bucket" "cloudavail_prod_bucket" {
  provider = "aws.cloudavail_prod"
  bucket   = "cloudavail-prod-bucket"
}
