# Overview
The purpose of this stack is to build an API Gateway with Access Logging.

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway_with_logging.yaml`

# Create an APIGatewayWithLogging Stack

`aws cloudformation create-stack --stack-name APIGatewayWithLogging --capabilities CAPABILITY_IAM --template-body file://api_gateway_with_logging.yaml`

# Update an APIGatewayWithLogging Stack

`aws cloudformation update-stack --stack-name APIGatewayWithLogging --capabilities CAPABILITY_IAM --template-body file://api_gateway_with_logging.yaml`

# Delete an APIGatewayWithLogging Stack

`aws cloudformation delete-stack --stack-name APIGatewayWithLogging`
