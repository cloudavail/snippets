# Overview
This template will create an ECS Cluster that allows the use of the aws ecs run-task command.

# Validate the ECS Run Task Template

`aws cloudformation validate-template --template-body file://ecs_run_task.yaml`

# Launch the ECS Run Task Stack

```
aws cloudformation create-stack --stack-name ecs-run-task --capabilities CAPABILITY_IAM --template-body file://ecs_run_task.yaml
```

# Update the ECS Run Task Stack

```
aws cloudformation update-stack --stack-name ecs-run-task --capabilities CAPABILITY_IAM  --template-body file://ecs_run_task.yaml
```

# Notes

## To Test
Run this command:
`latest_curl_task_definition=aws ecs list-task-definitions --family-prefix curl --query 'taskDefinitionArns[0]' --output text --sort DESC | cut -d / -f 2`
`aws ecs run-task --cluster ecs-run-task --task-definition $latest_curl_task_definition`

Check awslogs
- log group: `curl-log`

## Run aws ecs run-task with --override
`latest_curl_task_definition=aws ecs list-task-definitions --family-prefix curl --query 'taskDefinitionArns[0]' --output text --sort DESC | cut -d / -f 2`
`aws ecs run-task --cluster ecs-run-task-test --overrides '{ "containerOverrides": [ { "name": "curl", "command": ["-L", "https://espn.com" ] } ] }' --task-definition $latest_curl_task_definition`

- this command overrides curling "https://cloudavail.com" and instead curls "espn.com"
