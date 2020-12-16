# Overview

The CloudFormation file `debezium_in_ecs.yaml` in this directory will create a basic MSK cluster.

# Setup Required Variables

```
random_password=$(openssl rand -base64 12)
echo $random_password
```

# Create, Update or Delete Stack

## Validate Templates

`aws cloudformation validate-template --template-body file://debezium_in_ecs.yaml`

## Create a debezium-in-ecs Stack

`aws cloudformation create-stack --stack-name debezium-in-ecs --capabilities CAPABILITY_IAM --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://debezium_in_ecs.yaml`

## Update a debezium-in-ecs Stack

`aws cloudformation update-stack --stack-name debezium-in-ecs --capabilities CAPABILITY_IAM --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://debezium_in_ecs.yaml`


## Delete a debezium-in-ecs Stack

`aws cloudformation delete-stack --stack-name debezium-in-ecs`
