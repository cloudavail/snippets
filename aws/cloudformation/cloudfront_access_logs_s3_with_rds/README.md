# Overview
The CloudFormation file will create a basic CloudFront distribution, an S3 bucket for serving content to CloudFront and a MySQL RDS.

```
export AWS_PROFILE='cloudavail'
```

# Validate Templates
`aws cloudformation validate-template --template-body file://cloudfront_s3_rds.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name CloudFront-S3-rds --template-body file://cloudfront_s3_rds.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name CloudFront-S3-rds --template-body file://cloudfront_s3_rds.yaml`

# Delete Stack
`aws cloudformation update-stack --stack-name CloudFront-S3-rds`

# Athena
Once CloudFormation stack is built, you can:
- Use Athena to query CloudFront Logs in Athena Console
https://docs.aws.amazon.com/athena/latest/ug/cloudfront-logs.html