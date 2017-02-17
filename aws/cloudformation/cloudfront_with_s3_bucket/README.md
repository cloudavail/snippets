# Overview
This stack will create a CloudFront bucket that utilizes two different S3 buckets.

# Validate Stack
`aws cloudformation validate-template --template-body file://cloudfront_with_s3_bucket.yaml`

# Creates Stack
`aws cloudformation create-stack --stack-name CloudFrontWithS3Bucket --template-body file://cloudfront_with_s3_bucket.yaml --region us-west-2`
