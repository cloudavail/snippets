# Overview

This snippet is designed to create an IAM 

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_inline_and_managed_policies.yaml`

# Create the Stack

`aws cloudformation create-stack --stack-name IAMInlineAndManagedPolicies --template-body file://iam_inline_and_managed_policies.yaml --capabilities CAPABILITY_IAM`