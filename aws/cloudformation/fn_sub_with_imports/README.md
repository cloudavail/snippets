# Overview

# Validate the VPC Shared and VPC Client Templates

`aws cloudformation validate-template --template-body file://import_from.yaml`
`aws cloudformation validate-template --template-body file://import_to.yaml`

# Create the Shared VPC and the Client VPC

`aws cloudformation create-stack --stack-name ImportFrom --template-body file://import_from.yaml`
`aws cloudformation create-stack --stack-name ImportTo --template-body file://import_to.yaml`
