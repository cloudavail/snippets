# Objective

The objective of this snippet is to create an "Task" that utilizes an "IAM Role for Tasks" to perform specifically allowed AWS API Commands.

# Set Required Variables:

`AWS_DEFAULT_REGION="us-west-2"`

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_with_iam_task_role.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation create-stack --stack-name ECSWithIAMTaskRole --parameters ParameterKey=KeyName,ParameterValue=ecs --capabilities CAPABILITY_IAM --template-body file://ecs_with_iam_task_role.yaml`


# Update the VPC and ECS Cluster
`aws cloudformation update-stack --stack-name ECSWithIAMTaskRole --parameters ParameterKey=KeyName,ParameterValue=ecs --capabilities CAPABILITY_IAM --template-body file://ecs_with_iam_task_role.yaml`

# Perform Tests

# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name ECSWithIAMTaskRole
