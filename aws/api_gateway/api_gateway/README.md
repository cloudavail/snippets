# Overview
The purpose of this stack is to build an API Gateway.

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway.yaml`

# Create an APIGateway Stack

`aws cloudformation create-stack --stack-name APIGateway --template-body file://api_gateway.yaml`

# Update an APIGateway Stack

`aws cloudformation update-stack --stack-name APIGateway --template-body file://api_gateway.yaml`

# Delete an APIGateway Stack

`aws cloudformation delete-stack --stack-name APIGateway`
