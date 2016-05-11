# Overview
This snippet is a CloudFormation file that will:

- Accept a parameter (named "UseLBStickiness") to
- Use the parameter to configure a resource (specifically, an ELB) differently depending on the value passed to the UseLBStickiness parameter.

# Validate the Template

`aws cloudformation validate-template --template-body file://if_in_cloudformation_resource_property.json`

# Launch the Template

## Without LB Stickiness
`aws cloudformation create-stack --stack-name ELBWithoutStickiness --template-body file://if_in_cloudformation_resource_property.json`

## With LB Stickiness
`aws cloudformation create-stack --stack-name ELBWithStickiness --parameters ParameterKey=UseLBStickiness,ParameterValue=true --template-body file://if_in_cloudformation_resource_property.json`
