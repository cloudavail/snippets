# CloudFormation: use of an IAM Role for CloudFormation Deployments 

This document describes how to create an IAM Service Role for CloudFormation, particularly for an S3 bucket. 

# Prerequisites

1. Only user with admin permissions can create role/policy
2. The user using the IAMRole must have the following inline policies at a minimum:
	1. Service: IAM, Actions: Write:PassRole 
	2. Service: CloudFormation, Actions: List:* , Read:* , Write: CreateChangeSet, CreateStack, ExecuteChangeSet, UpdateStack
    
# Create Stacks in CLI

## Create the IAMRole Stack in Cloudformation:

`aws cloudformation create-stack --stack-name s3-stack-manager --template-body file://iamrole.yaml --capabilities CAPABILITY_NAMED_IAM`

Note: when using an IAM Role cloudformation file, it must include the --capabilities command 

## Create the S3 Bucket Stack:  

Using the role made from the S3 Stack Manager, create the S3 bucket stack using the role arn:

`aws cloudformation create-stack --stack-name [$STACK NAME] --role-arn [$ROLE ARN] --template-body file://s3bucket.yaml`

An example with the S3StackManager Role arn:

`aws cloudformation create-stack --stack-name s3-bucket-stack --role-arn arn:aws:iam::187376578462:role/S3StackManagerRole --template-body file://s3bucket.yaml`


# Delete the Stack in CLI:

`aws cloudformation delete-stack --stack-name [$STACK NAME]`

# Update the Stack in CLI: 

## Update the IAMRole Stack:

`aws cloudformation update-stack --stack-name [$STACK NAME] --template-body file://iamrole.yaml CAPABILITY_NAMED_IAM`

## Update the S3 Bucket Stack 

`aws cloudformation update-stack --stack-name [$STACK NAME] --role-arn [$ROLE ARN] --template-body file://s3bucket.yaml`
