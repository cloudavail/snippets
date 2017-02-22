# Overview
This stack _attempts_ to provide infrastructure allowing limit Security Group Egress to only a VPC Endpoint. The effect of this would be allowing an EC2 instance to only write to a VPC Endpoint but no other services. Note that this stack, as of 2017-02-21 fails in this attempt... no combination of Security Group Egress rules can effectively provide _just_ this limit.


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