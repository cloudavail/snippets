# Overview
This stack will create a CloudFront bucket that utilizes two different S3 buckets.

# Validate Stack
`aws cloudformation validate-template --template-body file://cloudformation_exported_value.yaml`
`aws cloudformation validate-template --template-body file://cloudformation_import_value.yaml`


# Create Stack Exporting a Resource
`aws cloudformation create-stack --stack-name ExportedS3Bucket --parameters ParameterKey=S3BucketName,ParameterValue=cloudavail-testbucket01 --template-body file://cloudformation_exported_value.yaml`

# Create a Stack Using Export
`aws cloudformation create-stack --stack-name ImportedS3Bucket --capabilities CAPABILITY_IAM --template-body file://cloudformation_import_value.yaml`

# Change the Export

`aws cloudformation update-stack --stack-name ExportedS3Bucket --parameters ParameterKey=S3BucketName,ParameterValue=cloudavail-testbucket02 --template-body file://cloudformation_exported_value.yaml`
