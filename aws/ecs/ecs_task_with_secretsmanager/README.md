# Set Required Variables:

`AWS_DEFAULT_REGION="us-west-2"`

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://ecs_with_task_with_secretsmanager.yaml`

# Create the ECS Cluster

`aws cloudformation create-stack --stack-name ecs-cluster-with-ssm --capabilities CAPABILITY_IAM --template-body file://ecs_with_task_with_secretsmanager.yaml`

# Update the ECS Cluster

`aws cloudformation update-stack --stack-name ecs-cluster-with-ssm --capabilities CAPABILITY_IAM --template-body file://ecs_with_task_with_secretsmanager.yaml`

# Delete the ECS Cluster

`aws cloudformation delete-stack --stack-name ecs-cluster-with-ssm`
