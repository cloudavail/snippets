# Overview

This snippet creates a macOS Instance running in an AWS VPC.

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://ec2_with_macos.yaml`

# Create the EC2 with IPs Different Subnets Stack

`aws cloudformation create-stack --stack-name macos-on-ec2 --template-body file://ec2_with_macos.yaml`

# Update the EC2 with IPs Different Subnets Stack

`aws cloudformation update-stack --stack-name macos-on-ec2 --template-body file://ec2_with_macos.yaml`

# Delete the EC2 with IPs Different Subnets Stack

`aws cloudformation delete-stack --stack-name macos-on-ec2`
