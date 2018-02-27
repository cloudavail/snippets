# Objective:

This snippet will perform all "CRUD" operations (create, read, update, delete) operations on an AWS Lambda function.

- Create a ZIP File containing a function
- Upload a Function to an S3 Bucket
- Create the Function using CloudFormation

# Prerequisites

Create a ZIP file and upload to an S3 Bucket.

## Create the lambda ZIP File

zip hello_world.zip hello_world.py

## Upload the lambda ZIP File
First, you'll need to set variables
lambda_code_s3_bucket="cloudavail-builds-usw2"
lambda_code_s3_key="test_lambda.zip"

aws s3 cp hello_world.zip s3://$lambda_code_s3_bucket/$lambda_code_s3_key

# Validate Stack
`aws cloudformation validate-template --template-body file://lambda_template.yaml`

# Create a Function
`aws cloudformation create-stack --stack-name LambdaLaunchedViaCFN --capabilities CAPABILITY_IAM --parameters ParameterKey=LambdaCodeS3Bucket,ParameterValue=$lambda_code_s3_bucket ParameterKey=LambdaCodeS3Key,ParameterValue=$lambda_code_s3_key --template-body file://lambda_template.yaml`

# Update the Function

# Delete the Function

