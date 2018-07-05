# Overview

This snippet serves to describe the use of terraform with an S3 backend - essentially, this provides a mechanism to share "tfstate" files amongst multiple users (and computers). The need to share "tfstate" files arises from the fact that 

1. Create a VPC, Two Subnets and "Security Group 01" - ensure that the tfstate file is written to S3.
2. Create an update to "Security Group 01" and ensure that the "tfstate" files are read from S3.

# Initial Run

Run `terraform plan`
Run `terraform apply`

At this point, the VPC, two subnets and "Security Group 01" have been created.
A file has been created in the bucket specified in `main.tf` has been created with the name `key`. This file contains contains information so that the resources created by terraform can be located and managed - and is this file is located in S3 it can be accessed by all users of the file `main.tf` (assuming they have access to this S3 bucket).

## Terraform State File Issues

- multiple team members (read: systems) require access to the same state files.
- concurrent updates: if two team members make modifications at/near the same time one set of terraform state files will be out of date
- challenge of code reuse: if the same terraform files are used to create dev/qa/prod environments) it is difficult to determine which state files correspond to which environment

## Potential Resolution - Git (out of favor)

- storing terraform state files in git - means that prior to any execution:

1. a terraform user would need to download the modified terraform state files
2. the terraform state files contain secrets (usernames/passwords)

## Preferred Resolution - Backends

Remote configuration stores the terraform state date in a "shared" location. The block of code shown below is what configures an "S3 Backend" for terraform.

```
terraform {
  backend "s3" {
    bucket = "cjohnson-terraform-test"
    key    = "terraform_s3_backend"
    region = "us-west-2"
  }
}
```

# Reference

- Terraform Up and Running, Writing Infrastructure as code, by Yevgeniy Brikman. This snippet was written after reading chapters one and two.