# Overview

This 

# Setup Secrets Manager Secrets

## Validate Templates

`aws cloudformation validate-template --template-body file://cloudformation_resolve_secrets_manager.yaml`

## Create Stack

`aws cloudformation create-stack --stack-name cloudformation-resolve-secrets-manager-consumer --template-body file://cloudformation_resolve_secrets_manager.yaml`

## Update Stack

`aws cloudformation update-stack --stack-name cloudformation-resolve-secrets-manager-consumer --template-body file://cloudformation_resolve_secrets_manager.yaml`

## Delete Stack

`aws cloudformation update-stack --stack-name cloudformation-resolve-secrets-manager-consumer`

# Setup Secrets Resolve Stack

## Validate Templates

`aws cloudformation validate-template --template-body file://cloudformation_resolve_secrets_manager.yaml`

## Create Stack

`aws cloudformation create-stack --stack-name cloudformation-resolve-secrets-manager-consumer --template-body file://cloudformation_resolve_secrets_manager.yaml`

## Update Stack

`aws cloudformation update-stack --stack-name cloudformation-resolve-secrets-manager-consumer --template-body file://cloudformation_resolve_secrets_manager.yaml`

## Delete Stack

`aws cloudformation update-stack --stack-name cloudformation-resolve-secrets-manager-consumer`
