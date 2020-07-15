# Overview
This cloudformation stack creates an AWS Budget and will notify those in subscribers.

```
export AWS_PROFILE='default'
```

## Validate stack
`aws cloudformation validate-template --template-body file://budget.yaml`

## Create Budget stack
`aws cloudformation create-stack --stack-name aws-budget --template-body file://budget.yaml`

## Create Budget change-set
`aws cloudformation create-change-set --stack-name aws-budget --template-body file://budget.yaml --change-set- aws-budget-change-set-$(date +%s)`

## Update Budget Stack
`aws cloudformation update-stack --stack-name aws-budget --template-body file://budget.yaml`

## Delete Budget stack
`aws cloudformation delete-stack --stack-name aws-budget`