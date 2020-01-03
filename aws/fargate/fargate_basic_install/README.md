# Validate CloudFormation
`aws cloudformation validate-template --template-body file://fargate_basic_install.yaml`

# Create the Fargate Cluster
`aws cloudformation create-stack --stack-name BasicFargate --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_basic_install.yaml`

# Update the Fargate Cluster
`aws cloudformation update-stack --stack-name BasicFargate --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_basic_install.yaml`

# Delete the Fargate Cluster
`aws cloudformation delete-stack --stack-name ecs-large-disk`
