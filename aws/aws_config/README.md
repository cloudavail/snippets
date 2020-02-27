
```
export AWS_PROFILE='admin-ctc'
export AWS_REGION='us-west-2'
```

# To receive RoleArn in ConfigRecorder Resource, run the following command
`aws iam create-service-linked-role --aws-service-name config.amazonaws.com`
Then paste Arn in to the `RoleArn` Property

# Validate Stack
`aws cloudformation validate-template --template-body file://aws_config.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name aws-config --capabilities CAPABILITY_NAMED_IAM --template-body file://aws_config.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name aws-config --capabilities CAPABILITY_NAMED_IAM --template-body file://aws_config.yaml`

