# Overview
Running this template will create:

1. a VPC with two subnets.
2. an IAM user with:
  a. An access key / secret key.
  b. Authorization to launch EC2 instances only in one of those subnets.

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_launch_in_particular_subnet.yaml`

# Launch the Template

`aws cloudformation create-stack --stack-name IAMLaunchInParticularSubnet --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_launch_in_particular_subnet.yaml`

# Create Change Set - If Needed

aws cloudformation create-change-set --stack-name IAMLaunchInParticularSubnet --change-set-name IAMLaunchInParticularSubnet-change-set-$(date +%s) --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_launch_in_particular_subnet.yaml

# Test Run Instances
aws ec2 run-instances --image-id ami-b2d463d2 --instance-type t2.micro --subnet-id <from private subnet> --profile <profile>
aws ec2 run-instances --image-id ami-b2d463d2 --instance-type t2.micro --subnet-id <from public subnet> --profile <profile>
