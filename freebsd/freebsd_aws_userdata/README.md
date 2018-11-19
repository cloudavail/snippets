# Overview
The CloudFormation file `freebsd_aws_userdata.yaml` in this directory will create an Auto Scaling Group utilizing FreeBSD and running userdata

# Validate Templates

`aws cloudformation validate-template --template-body file://freebsd_aws_userdata.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name FreeBSDwithUserData --template-body file://freebsd_aws_userdata.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name FreeBSDwithUserData --template-body file://freebsd_aws_userdata.yaml`
