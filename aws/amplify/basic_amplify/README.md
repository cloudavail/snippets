# Overview

The CloudFormation file `basic_amplify.yaml` in this directory will create a basic amplify application.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_amplify.yaml`

# Create Stack

`aws cloudformation create-stack --stack-name basic-amplify-app --template-body file://basic_amplify.yaml`

# Update Stack

`aws cloudformation update-stack --stack-name basic-amplify-app --template-body file://basic_amplify.yaml`

# Delete Stack

`aws cloudformation delete-stack --stack-name basic-amplify-app`
