provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "cloudavail_test_bucket" {
  bucket = "cloudavail-test-bucket"
}
