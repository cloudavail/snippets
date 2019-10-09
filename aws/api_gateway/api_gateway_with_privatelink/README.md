# Overview
The purpose of this stack is to build an API Gateway that utilizes AWS Private Link to connect to a resource within an AWS VPC.

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway_with_privatelink.yaml`

# Create an APIGatewayWithPrivateLink Stack

`aws cloudformation create-stack --stack-name APIGatewayWithPrivateLink --template-body file://api_gateway_with_privatelink.yaml`

# Update an APIGatewayWithPrivateLink Stack

`aws cloudformation update-stack --stack-name APIGatewayWithPrivateLink --template-body file://api_gateway_with_privatelink.yaml`

# Delete an APIGatewayWithPrivateLink Stack

`aws cloudformation delete-stack --stack-name APIGatewayWithPrivateLink`

# Test

To test that the VPC Link integration is working properly, you'll need to:

1. Perform a "deplyoyment" of the API to the "prod" stage (note: I have not confirmed this).
2. `curl` the URL of the API Gateway as follows: https://$api_gateway_name/$stage/test
