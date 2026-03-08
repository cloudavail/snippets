# Overview
The CloudFormation file cloudfront_s3.yaml in this directory will create a basic CloudFront distribution, and an S3 bucket for serving content to CloudFront.

```
export AWS_PROFILE='cloudavail'
```

# Validate Templates
`aws cloudformation validate-template --template-body file://cloudfront_access_log_with_s3_bucket.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name CloudFront-Access-log-with-S3 --template-body file://cloudfront_access_log_with_s3_bucket.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name CloudFront-Access-log-with-S3 --template-body file://cloudfront_access_log_with_s3_bucket.yaml`

# Delete Stack
`aws cloudformation update-stack --stack-name CloudFront-Access-log-with-S3`

## Step
Once CloudFormation stack is built, you can:
- Use Athena to query CloudFront Logs
https://docs.aws.amazon.com/athena/latest/ug/cloudfront-logs.html