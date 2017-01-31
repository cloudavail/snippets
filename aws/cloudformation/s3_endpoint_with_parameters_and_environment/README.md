# Overview
The CloudFormation file `s3_endpoint_allowed_resources.json` in this directory will:

1. Accept a "parameters" file containing parameters used in S3 Endpoint creation.
2. Create a CloudFormation stack containing a VPC and an S3 Endpoint - with the S3 Endpoint allowing only access to particular, explicitly named S3 buckets.

# Validate the Template

`aws cloudformation validate-template --template-body file://s3_endpoint_with_parameters_and_environment.yaml`

# Create Three Stacks - Each With Different Allowed Buckets

## Create a prd01 Bucket
`aws cloudformation create-stack --stack-name S3EndpointPrd01 --template-body file://s3_endpoint_with_parameters_and_environment.yaml --parameters file://prd01.json`

## Create a qa01 Bucket
`aws cloudformation create-stack --stack-name S3EndpointQA01 --template-body file://s3_endpoint_with_parameters_and_environment.yaml --parameters file://qa01.json`

## Create a dev01 Bucket
`aws cloudformation create-stack --stack-name S3EndpointDev01 --template-body file://s3_endpoint_with_parameters_and_environment.yaml --parameters file://dev01.json`