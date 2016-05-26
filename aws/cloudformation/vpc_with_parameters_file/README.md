# Overview
The CloudFormation file `vpc_with_parameters_file.json` in this directory will:

1. Accept a "parameters" file containing parameters used in VPC creation.
2. Create a CloudFormation stack containing a VPC and Subnets - using the values provided by the parameters file.

# Validate the Template

`aws cloudformation validate-template --template-body file://vpc_with_parameters_file.json`

# Create a VPC and Subnets in Default Region
`aws cloudformation create-stack --stack-name VPCwithParametersQA --template-body file://vpc_with_parameters_file.json --parameters file://qa_parameters_usw2.json --region us-west-2`

`aws cloudformation create-stack --stack-name VPCwithParametersProduction --template-body file://vpc_with_parameters_file.json --parameters file://production_parameters_usw2.json --region us-west-2`
