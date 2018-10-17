# Overview

This snippet will:

1. Build an aviatrix compliant VPC (aka a VPC with one public subnet) - in this case, the VPC will have a public and private subnet.
2. Create required IAM Roles for Aviatrix

# Create the Aviatrix Required Resources

## Validate Templates

`aws cloudformation validate-template --template-body file://basic_aviatrix_remote_access.yaml`

## Create Stack
`aws cloudformation create-stack --stack-name AviatrixVPC --capabilities CAPABILITY_NAMED_IAM --template-body file://basic_aviatrix_remote_access.yaml`

## Update Stack
`aws cloudformation update-stack --stack-name AviatrixVPC --capabilities CAPABILITY_NAMED_IAM --template-body file://basic_aviatrix_remote_access.yaml`

# Reference:

- Aviatrix AWS Controller: https://s3-us-west-2.amazonaws.com/aviatrix-download/docs/aviatrix_aws_controller_gsg.pdf
- IAM Roles: https://s3-us-west-2.amazonaws.com/aviatrix-download/Cloud-Controller/How+to+setup+IAM+role+for+Aviatrix.pdf

