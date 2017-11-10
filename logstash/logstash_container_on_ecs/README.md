# Validate CloudFormation
`aws cloudformation validate-template --template-body file://logstash_container_on_ecs.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation create-stack --stack-name LogstashOnECS --capabilities CAPABILITY_IAM --template-body file://logstash_container_on_ecs.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation update-stack --stack-name LogstashOnECS --capabilities CAPABILITY_IAM --template-body file://logstash_container_on_ecs.yaml`


# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name LogstashOnECS
