# Overview

This template will create a Postgres Based RDS Instance that is publicly accessible.

# Validate the ECS Run Task Template

`aws cloudformation validate-template --template-body file://ecs_run_task.yaml`

# Launch the ECS Run Task Stack

```
aws cloudformation create-stack --stack-name ECSRunTask --capabilities CAPABILITY_IAM --template-body file://ecs_run_task.yaml
```

# Update the ECS Run Task Stack

```
aws cloudformation update-stack --stack-name ECSRunTask --capabilities CAPABILITY_IAM  --template-body file://ecs_run_task.yaml
```

# Notes

## To Test
Run this command:
`aws ecs run-task --cluster ecs-run-task --task-definition curl:$num`

Check awslogs
- log group: `curl-log`

## Run aws ecs run-task with --override
aws ecs run-task --cluster ecs-run-task-test --overrides '{ "containerOverrides": [ { "name": "curl", "command": ["-L", "https://espn.com" ] } ] }' --task-definition curl:2

- this command overrides curling "https:/cloudavail.com" and instead curls "espn.com"

