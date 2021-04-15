# Overview
Stack creates an ECS app with Firelens

```
export AWS_PROFILE='cloudavail'
export AWS_REGION='us-east-1'
```

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_firelens_awslogs.yaml`

# Create ECS with Firelens
`aws cloudformation create-stack --stack-name EcsFirelens --parameters --capabilities CAPABILITY_IAM --template-body file://ecs_firelens_awslogs.yaml`

# Update ECS with Firelens
`aws cloudformation update-stack --stack-name EcsFirelens --parameters --capabilities CAPABILITY_IAM --template-body file://ecs_firelens_awslogs.yaml`

# Delete ECS with Firelens
`aws cloudformation delete-stack --stack-name EcsFirelens`
