# Validate CloudFormation
`aws cloudformation validate-template --template-body file://basic_efs_with_autoscaling.json`

# Set Variables as Required:
Example variables are provided below:

- `keypair=`

# Create an EFSwithAutoScaling Stack
`aws cloudformation create-stack --stack-name EFSwithAutoScaling --template-body file://basic_efs_with_autoscaling.json --parameters ParameterKey=KeyName,ParameterValue=efstest`

# Update an EFSwithAutoScaling Stack
`aws cloudformation update-stack --stack-name EFSwithAutoScaling --template-body file://basic_efs_with_autoscaling.json --parameters ParameterKey=KeyName,ParameterValue=efstest`


# Delete an EFSwithAutoScaling Stack
`aws cloudformation delete-stack --stack-name EFSwithAutoScaling`
