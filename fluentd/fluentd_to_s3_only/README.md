# Overview
This stack creates a Squid Proxy and allows s3 operations to go through this proxy.

# Validate Stack
`aws cloudformation validate-template --template-body file://fluentd_to_s3_only.yaml`

# Create FluentdToS3Only 
`aws cloudformation create-stack --stack-name FluentdToS3Only --capabilities CAPABILITY_IAM --template-body file://fluentd_to_s3_only.yaml`

# Update FluentdToS3Only Stack
`aws cloudformation update-stack --stack-name FluentdToS3Only --capabilities CAPABILITY_IAM --template-body file://fluentd_to_s3_only.yaml`
