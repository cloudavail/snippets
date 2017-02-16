# Overview
The CloudFormation file `security_group_change_by_environment.yaml` in this directory will create an ELB that allows different ingress depending on the environment.


# Validate the Template

`aws cloudformation validate-template --template-body file://security_group_change_by_environment.yaml`

## Create a Production Stack
`aws cloudformation create-stack --stack-name SecurityGroupChangeByEnvironmentProduction --template-body file://security_group_change_by_environment.yaml --parameters ParameterKey=Environment,ParameterValue=production`

## Create a Development Stack
`aws cloudformation create-stack --stack-name SecurityGroupChangeByEnvironmentDevelopment --template-body file://security_group_change_by_environment.yaml --parameters ParameterKey=Environment,ParameterValue=development`
