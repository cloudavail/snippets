# Overview
The CloudFormation file `elb_with_autoscaling_and_single_subnet.json` in this directory will:

1. Accept a "parameters" file containing parameters used in S3 Endpoint creation.
2. Create a CloudFormation stack containing a VPC and an S3 Endpoint - with the S3 Endpoint allowing only access to particular, explicitly named S3 buckets.

# Validate the Template

`aws cloudformation validate-template --template-body file://elb_with_autoscaling_and_single_subnet.json`

# Create an S3 Endpoint with Allowed S3 Resources

`keyname=your_keyname`

`aws cloudformation create-stack --stack-name ELBwithAutoScaling --template-body file://elb_with_autoscaling_and_single_subnet.json --parameters ParameterKey=KeyName,ParameterValue=$keyname`