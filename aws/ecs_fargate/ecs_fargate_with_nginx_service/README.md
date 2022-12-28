# Validate CloudFormation

```shell
aws cloudformation validate-template --template-body file://ecs_fargate_with_nginx_service.yaml
```

# Create the Fargate Cluster

```shell
aws cloudformation create-stack --stack-name ecs-fargate-with-nginx-service --parameters --capabilities CAPABILITY_IAM --template-body file://ecs_fargate_with_nginx_service.yaml
```

# Update the Fargate Cluster

```shell
aws cloudformation update-stack --stack-name ecs-fargate-with-nginx-service --parameters --capabilities CAPABILITY_IAM --template-body file://ecs_fargate_with_nginx_service.yaml
```

# Delete the Fargate Cluster

```shell
aws cloudformation delete-stack --stack-name ecs-fargate-with-nginx-service
```
