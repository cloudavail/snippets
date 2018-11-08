# Overview

This CloudFormation file will create a VPC with two public and two private subnets. This file and resulting VPC infrastructure has a number of different use cases but is being used for testing VPN appliances and remote access.

# Validate Templates

`aws cloudformation validate-template --template-body file://vpc_public_and_private_subnets.yaml`

# Create Initial Stack
`aws cloudformation create-stack --stack-name SimpleVPCandSubnets --template-body file://vpc_public_and_private_subnets.yaml`

# Update Stack Using Rolling Update
`aws cloudformation update-stack --stack-name SimpleVPCandSubnets --template-body file://vpc_public_and_private_subnets.yaml`
