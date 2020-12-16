# Set Required Variables:

`AWS_DEFAULT_REGION="us-west-2"`

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://sumologic_ecs_daemonset.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation create-stack --stack-name sumologic-ecs-daemonset --capabilities CAPABILITY_IAM --template-body file://sumologic_ecs_daemonset.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name sumologic-ecs-daemonset --capabilities CAPABILITY_IAM --template-body file://sumologic_ecs_daemonset.yaml`

# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name sumologic-ecs-daemonset`
