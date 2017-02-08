# Overview
The CloudFormation file `route53_change_by_environment.yaml` in this directory will:

1. Register resources in the cloudavail.com domain if "production" environment
2. Register resources in the cloudavail.net domain if _not_ "production environment"


# Validate the Template

`aws cloudformation validate-template --template-body file://route53_change_by_environment.yaml`

## Create a Production Stack
`aws cloudformation create-stack --stack-name Route53RegistrationTestProduction --template-body file://route53_change_by_environment.yaml --parameters ParameterKey=Environment,ParameterValue=production`

## Create a Development Stack
`aws cloudformation create-stack --stack-name Route53RegistrationTestDevelopment --template-body file://route53_change_by_environment.yaml --parameters ParameterKey=Environment,ParameterValue=development`
