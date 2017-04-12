# Overview

# Validate the Template

`aws cloudformation validate-template --template-body file://stack.yaml`

# Launch the Template

## Create a Password for RDS Instance
`rds_password=$(openssl rand -base64 12)`
`echo $rds_password`

## Create Protected Stack
`aws cloudformation create-stack --stack-name StackWithProtectedResource --parameters ParameterKey=RDSMasterUserPassword,ParameterValue=$rds_password --template-body file://stack.yaml`

# Apply a Policy

## Set a Stack Policy

`aws cloudformation set-stack-policy --stack-name StackWithProtectedResource --stack-policy-body file://stack_policy.json`

## Test that the Policy has been Applied

`aws cloudformation get-stack-policy --stack-name StackWithProtectedResource`

# Attempt to Update a Stack with a Policy

`aws cloudformation update-stack --stack-name StackWithProtectedResource --parameters ParameterKey=RDSMasterUserPassword,ParameterValue=$rds_password --template-body file://stack_updated.yaml`

# Attempt to Delete a Database from a Stack with a Stack Policy

`aws cloudformation update-stack --stack-name StackWithProtectedResource --parameters ParameterKey=RDSMasterUserPassword,ParameterValue=$rds_password --template-body file://stack_db_deleted.yaml`

