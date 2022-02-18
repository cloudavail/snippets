# Set Required Variables:

```
AWS_DEFAULT_REGION="us-west-2"
environment=dev
```

# Requirements
- have aws-cli installed
- cluster already running in ECS
- task-definition in ECS

# Command
`aws ecs run-task --cluster ecs-$env --task-definition nginx:191`
