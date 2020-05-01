## Objective
The objective of this snippet is to create a group of servers and use `aws cloudformation deploy`

```
export AWS_PROFILE='default'
export AWS_REGION='us-west-2'
```

# Notes
`cloudformation deploy` builds a stack in cloudformation and will also not return your cursor in terminal until stack builds or fails

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://nginx_fargate.yaml`

# Create the Fargate Stack using `deploy`
`aws cloudformation deploy --stack-name nginx --capabilities CAPABILITY_IAM --template-file ./nginx_fargate.yaml`

# Create the Fargate Stack change-set using `--no-execute-changeset`
`aws cloudformation deploy --stack-name nginx --capabilities CAPABILITY_IAM --template-file ./nginx_fargate.yaml --no-execute-changeset`

# Update the Code Deploy Server Stack with a change-set
`aws cloudformation deploy --stack-name nginx --capabilities CAPABILITY_IAM --template-file ./nginx_fargate.yaml`
