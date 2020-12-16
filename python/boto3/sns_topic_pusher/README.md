# Overview

The CloudFormation file `sns_topic.yaml` in this directory will create a basic CloudFront distribution.

# Validate Template

`aws cloudformation validate-template --template-body file://sns_topic.yaml`

# Create Stack

`aws cloudformation create-stack --stack-name sns-topic --template-body file://sns_topic.yaml`

# Update Stack

`aws cloudformation update-stack --stack-name sns-topic --template-body file://sns_topic.yaml`

# Delete Stack

`aws cloudformation delete-stack --stack-name sns-topic`

# Adding a Filter

## Only Send if Version = 1
```
{
  "version": [
    {
      "numeric": [
        "=",
        1
      ]
    }
  ]
}
```

## Only Send if UNDEFINED Vulnerabilities Exist

{
  "detail.finding-severity-counts.UNDEFINED": [
    {
      "exists": true
    }
  ]
}
