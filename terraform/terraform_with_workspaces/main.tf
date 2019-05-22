provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "cloudavail-terraform-usw2"
    key    = "terraform-with-workspaces/main.tf"
    region = "us-west-2"
  }
}

locals {
  workspace_test_bucket_name = "cloudavail-workspace-test-${var.environment}"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "${local.workspace_test_bucket_name}"
  acl    = "private"

  tags = {
    Name        = "${local.workspace_test_bucket_name}"
    Environment = "${var.environment}"
  }
}
