```
export AWS_PROFILE='default'
export AWS_REGION='us-west-2'
```

# Validate Stack
`aws cloudformation validate-template --template-body file://vpc_flow_logs_guard_duty.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name guard-duty --capabilities CAPABILITY_IAM --template-body file://guard_duty.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name guard-duty --capabilities CAPABILITY_IAM --template-body file://guard_duty.yaml`

# Delete Stack
`aws cloudformation update-stack --stack-name guard-duty`