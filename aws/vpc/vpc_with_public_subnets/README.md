# Overview

This CloudFormation file will create a VPC with two public subnets.

# Validate Templates

`aws cloudformation validate-template --template-body file://vpc_with_public_subnets.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name VPCwithPublicSubnets --template-body file://vpc_with_public_subnets.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name VPCwithPublicSubnets --template-body file://vpc_with_public_subnets.yaml`

# Delete Stack
`aws cloudformation delete-stack --stack-name VPCwithPublicSubnets`
