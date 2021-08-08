# Set Required Variables:

`AWS_DEFAULT_REGION="us-west-2"`

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://ecs_with_eventbridge_and_metrics.yaml`

# Create the ECS Cluster

`aws cloudformation create-stack --stack-name ecs-with-eventbridge-and-metrics --capabilities CAPABILITY_IAM --template-body file://ecs_with_eventbridge_and_metrics.yaml`

# Update the ECS Cluster

`aws cloudformation update-stack --stack-name ecs-with-eventbridge-and-metrics --capabilities CAPABILITY_IAM --template-body file://ecs_with_eventbridge_and_metrics.yaml`

# Delete the ECS Cluster

`aws cloudformation delete-stack --stack-name ecs-with-eventbridge-and-metrics`
