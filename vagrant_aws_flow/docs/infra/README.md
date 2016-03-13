# Overview
This document describes how to provision infrastructure using AWS CloudFormation.

# Updating AMIs
Updated AMIs can be found: https://cloud-images.ubuntu.com/locator/ec2/

## Look for:
- HVM instead of paravirtual (http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html)
- Arch Type: amd64
- Instance Type:
  - ebs-ssd - no _strong_ preference, but the cost is $0.80/mo for SSD versus $0.40/mo for magnetic
  - ebs for instance-store remains a holy war within AWS community

Here's the string you'll end up with to locate images:
`trusty hvm:ebs-ssd`

# Set Variables as Required:
Example variables are provided below:

- `environment="test01"`
- `region="us-west-2"`

## Validate CloudFormation
`aws cloudformation validate-template --template-body file://vagrant-aws-flow.json --region $region`

# Create a Vagrant AWS Flow Stack
`aws cloudformation create-stack --stack-name vaf-$environment --parameters ParameterKey=Environment,ParameterValue=$environment --capabilities CAPABILITY_IAM --template-body file://vagrant-aws-flow.json --region $region`

# Update a Vagrant AWS Flow Stack
`aws cloudformation update-stack --stack-name vaf-$environment --parameters ParameterKey=Environment,ParameterValue=$environment --capabilities CAPABILITY_IAM --template-body file://vagrant-aws-flow.json --region $region`

# Delete a Vagrant AWS Flow Stack
`aws cloudformation delete-stack --stack-name vaf-$environment --region $region`
