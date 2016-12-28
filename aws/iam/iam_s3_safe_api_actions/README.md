# Overview
Running this template will create:

1. an IAM user with limited permissions on an S3 bucket - specifically with the emphasis to minimize the likelihood of data leakage.

# Method

Allowing only access to actions (API Calls) that allow "CRUD" (Create, Read, Update, Delete) on S3 buckets and S3 objects should be relatively risk free - these operations are likely to be required (example: PutObject) but aren't likely to allow a data breach.

Denying (by not allowing) access to configuration actions - the configuration actions are those actions that are more likely to cause data leakage. An example of a configuration action would be the `s3:PutBucketAcl` or `s3:PutBucketPolicy` actions.

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_s3_safe_api_actions.yaml`

# Create the Stack

## Create a Random Password
`random_password=$(openssl rand -base64 24)`
`echo $random_password`

## Create the Stack

`aws cloudformation create-stack --stack-name IAMS3SafeAPIActions --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=RestrictedIAMUserPassword,ParameterValue=$random_password --template-body file://iam_s3_safe_api_actions.yaml`

# Create Change Set - If Needed

`aws cloudformation create-change-set --stack-name IAMS3SafeAPIActions --change-set-name IAMS3SafeAPIActions-change-set-$(date +%s) --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_s3_safe_api_actions.yaml`

# Test the Safe API Actions

- Create an S3 Bucket. Should be allowed.
- Create an S3 Bucket Policy. Should be denied.
- Create an S3 Bucket ACL. Should be denied.
- Create (Upload) an object.
- Delete the object.
- Delete the bucket.
