# Overview
This stack _attempts_ to provide infrastructure allowing limit Security Group Egress to only a VPC Endpoint. The effect of this would be allowing an EC2 instance to only write to a VPC Endpoint but no other services. Note that this stack, as of 2017-02-21 fails in this attempt... no combination of Security Group Egress rules can effectively provide _just_ this limit.


# Validate Stack
`aws cloudformation validate-template --template-body file://vpc_endpoint_with_controlled_egress.yaml`

# Create EC2S3EgressOnly Stack
`aws cloudformation create-stack --stack-name EC2S3EgressOnly --capabilities CAPABILITY_IAM --template-body file://vpc_endpoint_with_controlled_egress.yaml`

# Test:

Testing will be a bit challenging - you'll need to install some command line utilities to complete testing.

`aws s3 ls ec2s3egressonly-s3bucket-r6cuz2fmqw2k`

`tcpdump -n -i eth0 not port 22`