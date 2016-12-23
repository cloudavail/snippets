# Overview
Running this template will create:

1. a VPC with two subnets.
2. an IAM user with:
  a. AWS Console Login.
  b. Authorization to launch EC2 instances only in one of those subnets.
  c. The ability to create keypairs and security groups.
  c. Read-only authorization allowing use of the AWS Console without continued user interface errors.

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_launch_in_particular_subnet_aws_console.yaml`

# Launch the Template

`aws cloudformation create-stack --stack-name IAMLaunchInParticularSubnetAWSConsole --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_launch_in_particular_subnet_aws_console.yaml`

# Create Change Set - If Needed

aws cloudformation create-change-set --stack-name IAMLaunchInParticularSubnetAWSConsole --change-set-name IAMLaunchInParticularSubnetAWSConsole-change-set-$(date +%s) --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_launch_in_particular_subnet_aws_console.yaml
