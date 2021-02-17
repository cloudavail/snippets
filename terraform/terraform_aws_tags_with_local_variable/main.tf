locals {
  common_tags = {
    Application = "test"
    Environment = "${var.environment}"
    Owner       = "cloudavail"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test_bucket_01" {
  bucket = "cloudavail-test-bucket-01"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "cloudavail-test-bucket-01"
    )
  )}"
}

resource "aws_s3_bucket" "test_bucket_02" {
  bucket = "cloudavail-test-bucket-02"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "cloudavail-test-bucket-02"
    )
  )}"
}
