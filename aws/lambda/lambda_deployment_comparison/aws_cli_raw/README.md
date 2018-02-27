# Objective:

This snippet will perform all "CRUD" operations (create, read, update, delete) operations on an AWS Lambda function.

- Create a function using `aws lambda create-function`
- "Read" a function using `aws lambda get-function`
- Update a function using `aws lambda update-function-code`
- Delete a fuction using `aws lambda delete-function`

# Prerequisites

## IAM Role
The IAM Role that needs to be created is made up of the following parts:

### Description of IAM Role and IAM Role Configuration

- IAM Role: the IAM Role that the AWS Lambda service will assume when executing your code
- AssumeRolePolicyDocument: this policy instructs the IAM service to allow the AWS Lambda service to assume the IAM Role 
- Policy: the permissions that the IAM role allows the AWS Lambda service. In our particular case we will be using a "Managed Policy" provided by AWS.

### Commands:

aws iam create-role --role-name aws-cli-lambda-test-function-iam-role --assume-role-policy-document file://lambda_iam_role_configuration/assume-role-policy-document.json

aws iam attach-role-policy --role-name aws-cli-lambda-test-function-iam-role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

And get IAM Role ARN - this will be 

aws_cli_lambda_test_function_role_arn=$(aws iam get-role --role-name aws-cli-lambda-test-function-iam-role --query Role.Arn --output text)

echo $aws_cli_lambda_test_function_role_arn

## ZIP File

zip hello_world.zip hello_world.py

# Create a Function

## Create the Function

aws lambda create-function --function-name aws-cli-lambda-test-function --runtime python2.7 --role $aws_cli_lambda_test_function_role_arn --handler hello_world.handler --zip-file fileb://hello_world.zip

# Update the Function

aws lambda update-function-code --function-name aws-cli-lambda-test-function --zip-file fileb://hello_world.zip

# Delete the Function

aws lambda delete-function --function-name aws-cli-lambda-test-function
