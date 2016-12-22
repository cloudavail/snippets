# Overview
Running this template will create a VPC that contains an Auto Scaling Group with instances that have public IP addresses and can access the Internet.

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_launch_in_particular_subnet.yaml`

# Launch the Template

`aws cloudformation create-stack --stack-name IAMLaunchInParticularSubnet --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_launch_in_particular_subnet.yaml`

# Create Change Set - If Needed

aws cloudformation create-change-set --stack-name IAMLaunchInParticularSubnet --change-set-name IAMLaunchInParticularSubnet-change-set-$(date +%s) --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_launch_in_particular_subnet.yaml

# Test Run Instances
aws ec2 run-instances --image-id ami-b2d463d2 --instance-type t2.micro --subnet-id <from private subnet> --profile <profile>
aws ec2 run-instances --image-id ami-b2d463d2 --instance-type t2.micro --subnet-id <from public subnet> --profile <profile>
