
```
export AWS_PROFILE="default"
region="us-west-2"
environment="test"
```
# Validate a Shared Queue Stack

`aws cloudformation validate-template --template-body file://mq.yaml`

# Create an Amazon MQ Stack
```
aws cloudformation create-stack --stack-name amazonmq-$environment --template-body file://mq.yaml --parameters ParameterKey=Environment,ParameterValue=$environment --profile default --region $region
```

# Create a Amazon MQ Change Set
```
aws cloudformation create-change-set --stack-name amazonmq1-$environment \
  --change-set-name amazonmq-$environment-change-set-$(date +%s) --template-body file://mq.yaml \
  --parameters ParameterKey=Environment,ParameterValue=$environment \
  --region $region --profile default
```

# Delete a Amazon MQ Stack

`aws cloudformation delete-stack --stack-name amazonmq-$environment`

# Other Notes
- After creating/updating the stack, you need to enable "event expiration" within the UI or try and create the "Log Group" in CloudFormation and specify and "Event Expiration"