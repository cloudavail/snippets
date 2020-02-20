# Objective

The objective of this snippet is to create a Route53 Resolver that can be utilized to resolve "internal addresses" in multiple accounts.

# Evaluated Options

- creating a Route53 Resolver that resides in two VPCs. See file: `route53_resolver_multiple_vpcs_fail.yaml`)
- creating a Route53 Resolver that resides in VPC (called VPC01) which is peered with another VPC (VPC02). See file: `route53_resolver_vpc_peering.yaml`.

# Setup Route53 Resolver Multistack

## Validate CloudFormation

`aws2 cloudformation validate-template --template-body file://route53_resolver_vpc_peering.yaml`

## Create an Route53 Resolver Multistack Stack

`aws2 cloudformation create-stack --stack-name route53-resolver-multivpc --template-body file://route53_resolver_vpc_peering.yaml`

## Update an Route53 Resolver Multistack Stack

`aws2 cloudformation update-stack --stack-name route53-resolver-multivpc --capabilities CAPABILITY_IAM --template-body file://route53_resolver_vpc_peering.yaml`

## Delete an Route53 Resolver Multistack Stack

`aws2 cloudformation delete-stack --stack-name route53-resolver-multivpc`
