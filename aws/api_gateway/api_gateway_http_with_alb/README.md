# Overview

The purpose of this snippet is to build a http API Gateway within a VPC with an Application Load Balancer backend.

# Setting up the HTTP API Gateway with ALB Stack

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://api_gateway_http_with_alb.yaml`

## Create a HTTP API Gateway with Application Load Balancer

`aws cloudformation create-stack --stack-name http-api-gateway-with-alb --template-body file://api_gateway_http_with_alb.yaml`

## Update a HTTP API Gateway with Application Load Balancer

`aws cloudformation update-stack --stack-name http-api-gateway-with-alb --template-body file://api_gateway_http_with_alb.yaml`

## Delete a HTTP API Gateway with Application Load Balancer

`aws cloudformation delete-stack --stack-name http-api-gateway-with-alb`
