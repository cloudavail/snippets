# Overview

# Create the Packer Build VPC

In order to make easy the creation of Packer images - we utilize a "Build VPC" which configures a VPC and single, publicly accessible subnet.

## Validate Stack
`aws cloudformation validate-template --template-body file://vpc_for_windows_packer_build.yaml`

## Create WindowsAWSBuild Stack
`aws cloudformation create-stack --stack-name VPCForWindowsBuild --template-body file://vpc_for_windows_packer_build.yaml`

# Running Packer

## Export Required Variables for Packer

The variables below are, at present, required for the Packer builds. The commands below will capture the output from the previously created WindowsAWSBuild Stack and export for use with packer template files.

`export PACKER_VPC_ID=$(aws cloudformation describe-stacks --stack-name VPCForWindowsBuild --query 'Stacks[0].Outputs[?OutputKey==``VPCId``].OutputValue' --output text)`
`export PACKER_SUBNET_ID=$(aws cloudformation describe-stacks --stack-name VPCForWindowsBuild --query 'Stacks[0].Outputs[?OutputKey==``PublicSubnetId``].OutputValue' --output text)`
