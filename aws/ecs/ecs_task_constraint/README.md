# Overview

This snippet provides an ECS stack which can be utilized to understand ECS Task Constraints.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_task_constraint.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation create-stack --stack-name ecs-task-constraint --capabilities CAPABILITY_IAM --template-body file://ecs_task_constraint.yaml`

# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name ecs-task-constraint`
