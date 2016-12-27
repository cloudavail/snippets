-# Overview
Running this template will create:

1. a VPC with a Public subnet.
2. an IAM User with:
  a. An access key / secret key.
  b. Authorization to create instances, tag instances and reboot/stop/start/terminate instances only with an `owner` tag matching the value of the user's IAM username.

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_managed_by_ec2_owner.yaml`

# Launch the Template

`aws cloudformation create-stack --stack-name IAMManagedbyEC2Owner --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_managed_by_ec2_owner.yaml`

# Create Change Set - If Needed

`aws cloudformation create-change-set --stack-name IAMManagedbyEC2Owner --change-set-name IAMManagedbyEC2Owner-change-set-$(date +%s) --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_managed_by_ec2_owner.yaml`

# Run Instances

## Set Profile
`profile=<your profile>`

## Set Variables
`public_subnet_id=$(aws cloudformation describe-stack-resource --stack-name IAMManagedbyEC2Owner --logical-resource-id PublicSubnet01 --query StackResourceDetail.PhysicalResourceId --output text)`

## Run Instances
`aws ec2 run-instances --image-id ami-b2d463d2 --instance-type t2.micro --subnet-id $public_subnet_id --profile $profile`

## Perform Tests of Reboot, Stop, Start and Terminate Instances

## Failure
`aws ec2 create-tags --resources i-08433a1de5d646d61 --tags 'Key=Owner,Value=NotMyUser'`
`aws ec2 reboot-instances --instance-ids i-08433a1de5d646d61 --profile $profile`
`aws ec2 stop-instances --instance-ids i-08433a1de5d646d61 --profile $profile`
`aws ec2 start-instances --instance-ids i-08433a1de5d646d61 --profile $profile`
`aws ec2 terminate-instances --instance-ids i-08433a1de5d646d61 --profile $profile`

## Success 
`aws ec2 create-tags --resources i-08433a1de5d646d61 --tags 'Key=Owner,Value=RestrictedIAMUser'`
`aws ec2 reboot-instances --instance-ids i-08433a1de5d646d61 --profile $profile`
`aws ec2 stop-instances --instance-ids i-08433a1de5d646d61 --profile $profile`
`aws ec2 start-instances --instance-ids i-08433a1de5d646d61 --profile $profile`
`aws ec2 terminate-instances --instance-ids i-08433a1de5d646d61 --profile $profile`
