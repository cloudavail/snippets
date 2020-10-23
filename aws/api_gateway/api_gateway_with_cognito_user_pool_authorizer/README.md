# Overview

The purpose of this stack is to build an API Gateway that supports multiple the ability to access a given resource via multiple user pools.

# Tested Methods

- have a resource with multiple "Authorizatizers"
- have an "Authorizer" with multiple user pools

# Testing Multiple User Pools with a Single Authorizer

```
aws apigateway create-authorizer --rest-api-id m7ft8vlcrh --name test --type COGNITO_USER_POOLS \
--provider-arns 'arn:aws:cognito-idp:us-west-2:187376578462:userpool/us-west-2_EzOL3Lxpy, arn:aws:cognito-idp:us-west-2:187376578462:userpool/us-west-2_r0m9zMrnF'
```

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway.yaml`

# Create an APIGateway Stack

`aws cloudformation create-stack --stack-name APIGateway --template-body file://api_gateway.yaml`

# Update an APIGateway Stack

`aws cloudformation update-stack --stack-name APIGateway --template-body file://api_gateway.yaml`

# Delete an APIGateway Stack

`aws cloudformation delete-stack --stack-name APIGateway`
