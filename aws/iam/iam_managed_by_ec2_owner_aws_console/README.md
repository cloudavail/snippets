-# Overview
Running this template will create:

1. a VPC with a Public subnet.
2. an IAM User with:
  a. An access key / secret key.
  b. Authorization to create instances, tag instances and reboot/stop/start/terminate instances only with an `owner` tag matching the value of the user's IAM username.

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_managed_by_ec2_owner_aws_console.yaml`

# Launch the Template

`aws cloudformation create-stack --stack-name IAMManagedbyEC2OwnerAWSConsole --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_managed_by_ec2_owner_aws_console.yaml`

# Create Change Set - If Needed

`aws cloudformation create-change-set --stack-name IAMManagedbyEC2OwnerAWSConsole --change-set-name IAMManagedbyEC2OwnerAWSConsole-change-set-$(date +%s) --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_managed_by_ec2_owner_aws_console.yaml`
