# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_cpu_utilization_measurement.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation create-stack --stack-name ECS-CPU-Test --capabilities CAPABILITY_IAM --template-body file://ecs_cpu_utilization_measurement.yaml`

# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name ECS-CPU-Test
