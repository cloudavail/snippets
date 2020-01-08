# Set Required Variables:

`AWS_DEFAULT_REGION="us-west-2"`

# Validate CloudFormation

`aws2 cloudformation validate-template --template-body file://ecs_cluster.yaml`

# Create the VPC and ECS Cluster

`aws2 cloudformation create-stack --stack-name ecs-cluster --capabilities CAPABILITY_IAM --template-body file://ecs_cluster.yaml`

# Delete the VPC and ECS Cluster

`aws2 cloudformation delete-stack --stack-name ecs-cluster`
