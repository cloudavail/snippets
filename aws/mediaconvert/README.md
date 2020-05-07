# Set Required Variables
```
export AWS_REGION='us-west-2'
export AWS_PROFILE='default'
```

# Validate MediaConvert CloudFormation

`aws cloudformation validate-template --template-body file://mediaconvert.yaml`

# Create a MediaConvert Stack

`aws cloudformation create-stack --stack-name mediaconvert --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=Environment,ParameterValue=$environment --template-body file://mediaconvert.yaml`

# Update a MediaConvert with a Change-Set

`aws cloudformation create-change-set --stack-name mediaconvert --change-set-name mediaconvert-change-set-$(date +%s) --template-body file://mediaconvert.yaml`

# Update a MediaConvert Stack

`aws cloudformation update-stack --stack-name mediaconvert --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=Environment,ParameterValue=$environment --template-body file://mediaconvert.yaml`

# Delete a MediaConvert Stack

`aws cloudformation delete-stack --stack-name mediaconvert`
