# Overview

The CloudFormation file `route53_weighted_routing.yaml` in this directory will create a VPC, two ALBs and a Route53 configuration that balances requests between these two zones.

# Validate Template

`aws cloudformation validate-template --template-body file://route53_weighted_routing.yaml`

# Create Stack

`aws cloudformation create-stack --stack-name Route53WeightedRouting --template-body file://route53_weighted_routing.yaml`

# Update Stack

`aws cloudformation update-stack --stack-name Route53WeightedRouting --template-body file://route53_weighted_routing.yaml`

# Delete Stack

`aws cloudformation delete-stack --stack-name Route53WeightedRouting`

# Describing ELBv2 SSL Policies:

`aws elbv2 describe-ssl-policies`

# Testing Connectivity

`curl --dns-servers 8.8.8.8 www.cloudavail.com`
