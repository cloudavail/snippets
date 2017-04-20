# Overview

Note that the EC2 instances within this stack have problems mounting the EFS / NFS volumes the _first_ time the stack is launched - this is presumably because the EC2 instances come up _prior_ to the creation of the EFS mount point. I have not attempted to resolve this issue as the actual EFS service I'll be building has EFS as one CloudFormation stack and the EC2 instances as a second stack.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://basic_efs_with_autoscaling.yaml`

# Set Variables as Required:
Example variables are provided below:

- `keypair=`

# Create an EFSwithAutoScaling Stack
`aws cloudformation create-stack --stack-name EFSwithAutoScaling --parameters ParameterKey=KeyName,ParameterValue=$keypair --template-body file://basic_efs_with_autoscaling.yaml`

# Update an EFSwithAutoScaling Stack
`aws cloudformation update-stack --stack-name EFSwithAutoScaling --parameters ParameterKey=KeyName,ParameterValue=$keypair --template-body file://basic_efs_with_autoscaling.yaml`

# Delete an EFSwithAutoScaling Stack
`aws cloudformation delete-stack --stack-name EFSwithAutoScaling`

