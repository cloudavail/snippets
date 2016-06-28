# Overview
The CloudFormation file `s3_endpoint_allowed_resources.json` in this directory will:

1. Accept a "parameters" file containing parameters used in S3 Endpoint creation.
2. Create a CloudFormation stack containing a VPC and an S3 Endpoint - with the S3 Endpoint allowing only access to particular, explicitly named S3 buckets.

# Validate the Template

`aws cloudformation validate-template --template-body file://s3_endpoint_allowed_resources.json`

# Create an S3 Endpoint with Allowed S3 Resources
`aws cloudformation create-stack --stack-name S3AllowedResources --template-body file://s3_endpoint_allowed_resources.json --parameters file://s3_endpoint_allowed_resources_parameters.json --region us-west-2`