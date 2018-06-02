# Overview
The CloudFormation file `or_condition.yaml` in this directory will:

1. Create an internet-facing ELBv2 if "prd01" or "stg01" environment
2. Otherwise create an internal ELBv2

I know this example is contrived and would be better handled by a "Mapping" but I believe the example best communicates the use of the "OR" condition example.

# Validate the Template

`aws cloudformation validate-template --template-body file://or_condition.yaml`

## Create Stacks

`environment=prd01`
`environment=stg01`
`environment=dev01`

`aws cloudformation create-stack --stack-name OrCondition-$environment --template-body file://or_condition.yaml --parameters ParameterKey=Environment,ParameterValue=$environment`
