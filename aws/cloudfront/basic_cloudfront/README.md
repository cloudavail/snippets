# Overview
The CloudFormation file `basic_cloudfront.yaml` in this directory will create a basic CloudFront distribution.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_cloudfront.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name BasicCloudFront --template-body file://basic_cloudfront.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name BasicCloudFront --template-body file://basic_cloudfront.yaml`

# Delete Stack
`aws cloudformation delete-stack --stack-name BasicCloudFront`
