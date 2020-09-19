# Overview

The purpose of this stack is to build an API Gateway that utilizes multiple "User Pools". The snippet creates this, although the use of multiple User Pools in authentication is untested.

# Setup Stack

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway.yaml`

## Create an APIGateway Stack

`aws cloudformation create-stack --stack-name APIGateway --template-body file://api_gateway.yaml`

## Update an APIGateway Stack

`aws cloudformation update-stack --stack-name APIGateway --template-body file://api_gateway.yaml`

## Delete an APIGateway Stack

`aws cloudformation delete-stack --stack-name APIGateway`

# Attempt to Setup Multiple User Pools

## Get Your Rest API

`aws apigateway get-rest-apis`

## Get Your User Pools

`aws cognito-idp list-user-pools --max-results 60 --query "UserPools[*].[Id,Name]" --output text`

## Get Your User Pool Arns

```
aws cognito-idp describe-user-pool --user-pool-id us-west-2_EzOL3Lxpy --query UserPool.Arn --output text
aws cognito-idp describe-user-pool --user-pool-id us-west-2_r0m9zMrnF --query UserPool.Arn --output text
```

## Configure Multiple User Pools

```
aws apigateway create-authorizer \
--rest-api-id m7ft8vlcrh \
--type COGNITO_USER_POOLS \
--name 'cognito-auth-name' \
--provider-arns arn:aws:cognito-idp:us-west-2:187376578462:userpool/us-west-2_EzOL3Lxpy arn:aws:cognito-idp:us-west-2:187376578462:userpool/us-west-2_r0m9zMrnF \
--identity-source 'method.request.header.Authorization'
```
