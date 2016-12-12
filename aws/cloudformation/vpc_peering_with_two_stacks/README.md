# Overview
The two CloudFormation files in will create two VPCs:

- a "Shared VPC" - which would represent a VPC containing resources shared amongst multiple VPCs
- a "Client VPC" - which would represent one or more VPCs containing that utilizes resources provided by "Shared VPC"

# Validate the VPC Shared and VPC Client Templates

`aws cloudformation validate-template --template-body file://vpc_shared.json`

`aws cloudformation validate-template --template-body file://vpc_client_01.json`

# Create the Shared VPC and the Client VPC

`aws cloudformation create-stack --stack-name VPCShared --template-body file://vpc_shared.json`

`vpc_shared_id=$(aws cloudformation describe-stacks --stack-name VPCShared --query 'Stacks[0].Outputs[?OutputKey==`SharedVPCId`].OutputValue' --output text)`

`aws cloudformation create-stack --stack-name VPCClient01 --parameters ParameterKey=SharedVPCId,ParameterValue=$vpc_shared_id --template-body file://vpc_client_01.json`

