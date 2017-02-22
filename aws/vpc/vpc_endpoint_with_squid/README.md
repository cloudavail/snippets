# Overview
This stack creates a Squid Proxy and allows s3 operations to go through this proxy.

# Validate Stack
`aws cloudformation validate-template --template-body file://vpc_endpoint_with_squid.yaml`

# Create EC2S3EgressThroughSquid Stack
`aws cloudformation create-stack --stack-name EC2S3EgressThroughSquid --capabilities CAPABILITY_IAM --template-body file://vpc_endpoint_with_squid.yaml`

# Update EC2S3EgressThroughSquid Stack
`aws cloudformation update-stack --stack-name EC2S3EgressThroughSquid --capabilities CAPABILITY_IAM --template-body file://vpc_endpoint_with_squid.yaml`

# And Test:

## From "S3Writer"

`export http_proxy='http://$elb_name:3128'`
`export https_proxy='http://$elb_name:3128'`
`export NO_PROXY=169.254.169.254`
`curl www.google.com`

## Install Tools for Testing
`yum -y install epel-release`
`yum -y install awscli`

## Test
`aws s3 ls ec2s3egressthroughsquid-s3bucket-1p4p31yyk7hcz`
`aws s3 cp test.txt s3://ec2s3egressthroughsquid-s3bucket-1p4p31yyk7hcz/`