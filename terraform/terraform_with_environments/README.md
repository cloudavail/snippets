# Overview

This snippet is intended to create a VPC and subnets that differ "per environment" as follows:

## In QA:
- VPC CIDR: 10.0.0.0/24
- Subnets: 10.0.0.0/25, 10.0.0.128/25

## In Prod:

- VPC CIDR: 10.0.1.0/24
- Subnets: 10.0.1.0/25, 10.0.1.128/25

# Running Terraform

## Terraform Get

Terraform "get" is used to "download" or "update" modules used in a module - you'll need to run `terraform get` in the `environment directory` (either: `qa` or `prod`) prior to running `terraform plan` or `terraform apply`. `terraform get` generates a `/.terraform/modules/modules.json` and another file named similarly to `.terraform/modules/fe90bc6c39194bb350e1725a9de1a72d/main.tf`

## Terraform Plan and Apply

To run, do the following - go into the appropriate environment, either `qa` or `prod` and execute a `terraform plan` followed by a `terraform apply`.
