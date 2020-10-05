```
export AWS_PROFILE='cloudavail'
export AWS_REGION='us-west-2'
```

# Steps to Import Existing S3 Bucket to CFN (https://aws.amazon.com/blogs/aws/new-import-existing-resources-into-a-cloudformation-stack/)
- Locate S3 Bucket Name and Region
- In CloudFormation console, Create Stack with existing resources (import resources)
- Upload template file that mirrors S3 Bucket
- Enter S3 Bucket Name
- Enter stack-name

## Validate CloudFormation
aws cloudformation validate-template --template-body file://s3_import.yaml

## Create the S3 Bucket and CloudFront stack
`aws cloudformation create-stack --stack-name s3-import-test --template-body file://s3_import.yaml`

## Update the S3 Bucket and CloudFrontwith a Change-Set
`aws cloudformation create-change-set --stack-name s3-import-test --change-set-name s3-import-test-change-set-$(date +%s) --template-body file://s3_import.yaml`

## Update the S3 Bucket and CloudFront stack
`aws cloudformation update-stack --stack-name s3-import-test --template-body file://s3_import.yaml`

## Delete the S3 Bucket and CloudFront stack
`aws cloudformation delete-stack --stack-name s3-import-test`