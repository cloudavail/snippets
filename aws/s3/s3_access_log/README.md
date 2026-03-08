# Set Required Variables

```
environment=test
export AWS_PROFILE='cloudavail'
```

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://s3_access_log.yaml`

# Create a S3 Stack

`aws cloudformation create-stack --stack-name s3-buckets-$environment --capabilities CAPABILITY_IAM --parameters ParameterKey=Environment,ParameterValue=$environment --template-body file://s3_access_log.yaml`

# Update a S3 Stack with a Change-Set

`aws cloudformation create-change-set --stack-name s3-buckets-$environment --change-set-name s3-buckets-$environment-change-set-$(date +%s) --capabilities CAPABILITY_IAM --parameters ParameterKey=Environment,ParameterValue=$environment --template-body file://s3_access_log.yaml`

# Update a S3 Stack

`aws cloudformation update-stack --stack-name s3-buckets-$environment --capabilities CAPABILITY_IAM --parameters ParameterKey=Environment,ParameterValue=$environment --template-body file://s3_access_log.yaml`

# Delete a S3 Stack

`aws cloudformation delete-stack --stack-name s3-buckets-$environment`
