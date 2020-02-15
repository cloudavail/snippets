# Overview
The purpose of this stack is to build an API Gateway.

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway_private.yaml`

# Create an APIGatewayPrivate Stack

`aws cloudformation create-stack --stack-name APIGatewayPrivate --template-body file://api_gateway_private.yaml`

# Update an APIGatewayPrivate Stack

`aws cloudformation update-stack --stack-name APIGatewayPrivate --template-body file://api_gateway_private.yaml`

# Delete an APIGatewayPrivate Stack

`aws cloudformation delete-stack --stack-name APIGatewayPrivate`
