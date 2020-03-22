# Overview

This snippet creates a basic AmazonMQ stack.

# Notes

## Logging

At present, the AmazonMQ creates a CloudWatch "Log Group" with the "id part" of the broker ARN, similar to `/aws/amazonmq/broker/b-398d848a-424e-43aa-b13b-42b78ef4bdaa/general`. A few notes:

1. It does not appear to be possible to change the "id part" of the broker ARN as this does not use the "Broker Name" property.
2. The CloudWatch Log Group is created without an "Event Expiration" policy.
3. Cannot !Sub $BrokerARN as part of LogGroupName.
4. Event Expiration must be enabled through UI.
5. Remember to remove Log Groups if Deleting stack.

# Validate an AmazonMQ Stack

`aws cloudformation validate-template --template-body file://amazonmq.yaml`

# Create an AmazonMQ Stack

```
random_password=$(openssl rand -base64 12)
aws cloudformation create-stack --stack-name amazonmq --parameters ParameterKey=AmazonMQBrokerAdminUserPassword,ParameterValue=$random_password --template-body file://amazonmq.yaml
```

# Update an AmazonMQ Stack

`aws cloudformation create-stack --stack-name amazonmq --template-body file://amazonmq.yaml`

# Delete an AmazonMQ Stack

`aws cloudformation delete-stack --stack-name amazonmq`
