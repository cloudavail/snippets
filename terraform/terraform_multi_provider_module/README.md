# Overview

This snippet attempts to utilize a single terraform configuration to provision resources (s3 buckets) in multiple accounts where a child module is present. The very specific use case for this is where DNS resources reside in one account and where other resources resize in a different account.

# Instructions for Use

For those familiar with terraform, this snippet follows the common `terraform init`, `terraform plan`, `terraform apply` paradigm.
