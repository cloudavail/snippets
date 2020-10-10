# Overview

This snippet creates a stack that will create an ECR Repository and instructions for pushing an image to this repository.

# Setup CloudFormation Stack


## Validate CloudFormation

`aws cloudformation validate-template --template-body file://ecr_with_scan_and_sns_publish.yaml`

## Create the ECR With Scan and SNS Public Stack

`aws cloudformation create-stack --stack-name ecr-with-scan-and-sns-publish --template-body file://ecr_with_scan_and_sns_publish.yaml`

## Update the ECR With Scan and SNS Public Stack

`aws cloudformation update-stack --stack-name ecr-with-scan-and-sns-publish --template-body file://ecr_with_scan_and_sns_publish.yaml`

## Delete the ECR With Scan and SNS Public Stack

`aws cloudformation delete-stack --stack-name ecr-with-scan-and-sns-publish`


# To Test the ECR Scanning

- subscribe to SNS topic (check spam folder)
- get ECR login for repository: `aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.${aws_region}.amazonaws.com`
- push Image to ECR Repository: docker tag nginx:latest 187376578462.dkr.ecr.us-west-2.amazonaws.com/cloudavail/ecr-with-scan-test
- 