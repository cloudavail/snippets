# Overview

This document describes how to move a resource created in one configuration and move this resource into another configuration.

# Move a Resource within Statefile/Configuration

## Setup Procedure

1. Create a terraform configuration that creates an S3 Bucket (`mv_within_configuration`).
2. `terraform apply` this configuration so as to create a `terraform.tfstate` file.

## Move Procedure

`terraform mv` this resource (and state) within the `main.tf` configuration file.

`terraform state mv aws_s3_bucket.cloudavail_test_bucket aws_s3_bucket.cloudavail_test_bucket_new`

## Outcome

This will rename the resource _in the terraform.tfstate_ file. A subsequent `terraform apply` run will _remove_ the bucket that was renamed (because it doesn't exist in `main.tf` and recreate the original bucket).

If you do not wish to recreate the resource, you'll need to rename the resource _within_ the terraform file itself as well. To do this, open `main.tf` and change:
from:
```
resource "aws_s3_bucket" "cloudavail_test_bucket" {
  bucket = "cloudavail-test-bucket"
}
```
to:
```
resource "aws_s3_bucket" "cloudavail_test_bucket_new" {
  bucket = "cloudavail-test-bucket"
}
```

# Move a Resource to another Statefile/Configuration

## Setup Procedure

1. Create a terraform configuration that creates an S3 Bucket (`source_configuration`).
2. `terraform apply` this configuration so as to create a `terraform.tfstate` file.
3. Create a terraform configuration that performs no operations (`target_configuration`).
4. `terraform apply` this configuration so as to create a `terraform.tfstate` file.

## Move Procedure

1. `cd source_configuration`
2. `terraform state mv -state-out=../target_configuration/terraform.tfstate aws_s3_bucket.cloudavail_test_bucket aws_s3_bucket.cloudavail_test_bucket`

## Outcome

This will move the state of the `aws_s3_bucket.cloudavail_test_bucket` from the file `terraform.tfstate` in the `source_configuration` directory and into `target_configuration/terraform.tfstate`. As a result of this change, you should also move files within the `source_configration\main.tf` and `target_configuration\main.tf` files.

from `target_configuration/terraform.tfstate`:
```
resource "aws_s3_bucket" "cloudavail_test_bucket" {
  bucket = "cloudavail-test-bucket"
}
```
to `source_configration\main.tf`:
```
resource "aws_s3_bucket" "cloudavail_test_bucket" {
  bucket = "cloudavail-test-bucket"
}
```
