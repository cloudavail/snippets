# Objective

The objective of this snippet is to create an ECS Cluster that utilizes a launch template.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_with_launch_template.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation create-stack --stack-name ECSWithLaunchTemplate --capabilities CAPABILITY_IAM --template-body file://ecs_with_launch_template.yaml`


# Update the VPC and ECS Cluster
`aws cloudformation update-stack --stack-name ECSWithLaunchTemplate --capabilities CAPABILITY_IAM --template-body file://ecs_with_launch_template.yaml`

# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name ECSWithLaunchTemplate
