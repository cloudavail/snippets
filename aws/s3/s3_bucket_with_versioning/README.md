# Create the Stack

## Set Variables

```
AWS_PROFILE=default
customer=cloudavail
environment=test
region=us-west-2
```

## Validate Cloudformation Template

`aws cloudformation validate-template --template-body file://bucket-with-versioning.yaml`

## Create Stack

`aws cloudformation create-stack \
  --stack-name $customer-bucket-with-versioning \
  --template-body file://bucket-with-versioning.yaml \
  --parameters ParameterKey=Environment,ParameterValue=$environment \
  --region $region`

## Update Stack

`aws cloudformation update-stack \
  --stack-name $customer-bucket-with-versioning \
  --template-body file://bucket-with-versioning.yaml \
  --parameters ParameterKey=Environment,ParameterValue=$environment`

## Create Change Set

`aws cloudformation create-change-set \
  --stack-name $customer-bucket-with-versioning \
  --template-body file://bucket-with-versioning.yaml \
  --parameters ParameterKey=Environment,ParameterValue=$environment`

## Delete Stack

`aws cloudformation update-stack \
  --stack-name $customer-bucket-with-versioning \
  --template-body file://bucket-with-versioning.yaml \
  --parameters ParameterKey=Environment,ParameterValue=$environment`
