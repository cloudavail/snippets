# Overview

This document explains how to build an EC2 Instance with a Launch Configuration in Cloudformation via the terminal.

# Set your AWS Profile and AWS Region

```
export AWS_DEFAULT_REGION='us-west-2'
export AWS_PROFILE='cloudavail'
```

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://toolserver.yaml`

# Create the EC2 Instance stack

`aws cloudformation create-stack --stack-name toolserver --template-body file://toolserver.yaml`

# Update the EC2 Instance with a Change-Set
`aws cloudformation create-change-set --stack-name toolserver --change-set-name ec2-instance-change-set-$(date +%s) --template-body file://toolserver.yaml`

# Update the EC2 Instance stack

`aws cloudformation update-stack --stack-name toolserver --template-body file://toolserver.yaml`

# Delete the EC2 Instance stack

`aws cloudformation delete-stack --stack-name toolserver`

