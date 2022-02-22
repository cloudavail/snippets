# Overview

This template will create a Postgres Based RDS Instance that is publicly accessible.

# Validate the Basic RDS Instance Template

`aws cloudformation validate-template --template-body file://ecs_run_task.yaml`

# Launch the ecs run task Stack

```
aws cloudformation create-stack --stack-name ECSRunTask --capabilities CAPABILITY_IAM --template-body file://ecs_run_task.yaml
```

# Update the Basic RDS Instance Stack

```
aws cloudformation update-stack --stack-name ECSRunTask --capabilities CAPABILITY_IAM  --template-body file://ecs_run_task.yaml
```

# Notes
## Requirements
- have aws-cli installed
- cluster already running in ECS
- task-definition in ECS

## To Test
Run this command:
`aws ecs run-task --cluster ecs-run-task --task-definition curl:$num`

Check awslogs
- log group: `curl-log`

## Run aws ecs run-task with --override
aws ecs run-task --cluster ecs-run-task-test --overrides '{ "containerOverrides": [ { "name": "curl", "command": ["https://cloudavail.com", "-L", "https://espn.com" ] } ] }' --task-definition curl:2

- this command overrides curling "https:/cloudavail.com" and instead curls "espn.com"

