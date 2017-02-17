# Overview
This stack will create a CloudFront bucket that utilizes two different S3 buckets.

# Validate Stack
`aws cloudformation validate-template --template-body file://cloudfront_with_two_s3_buckets.yml`

# Creates Stack
`aws cloudformation create-stack --stack-name CloudFrontWithTwoS3Buckets --template-body file://cloudfront_with_two_s3_buckets.yml --region us-west-2`

