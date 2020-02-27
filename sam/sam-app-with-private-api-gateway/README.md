# sam-app

This snippet creates an "API Gateway private endpoint" as described in the blog post https://aws.amazon.com/blogs/compute/introducing-amazon-api-gateway-private-endpoints/.

# Requirements

1. A VPC with "DNS resolution enabled".
2. A VPC Endpoint with the following:
  1. Service name: “com.amazonaws.{region}.execute-api”
  2. the property: `PrivateDnsEnabled: true`


# Setup the initial VPC Stack

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://vpc.yaml`

## Create a Private API Gateway in VPC Stack

`aws2 cloudformation create-stack --stack-name vpc-for-sam-app-with-private-api-gateway --template-body file://vpc.yaml`

## Update a Private API Gateway in VPC Stack

`aws2 cloudformation update-stack --stack-name vpc-for-sam-app-with-private-api-gateway --template-body file://vpc.yaml`

## Delete a Private API Gateway in VPC Stack

`aws2 cloudformation delete-stack --stack-name vpc-for-sam-app-with-private-api-gateway`