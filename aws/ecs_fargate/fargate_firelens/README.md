# Validate CloudFormation
`aws cloudformation validate-template --template-body file://fargate_firelens.yaml`

# Create the Fargate Cluster
`aws cloudformation create-stack --stack-name FargateFirelens --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_firelens.yaml`

# Update the Fargate Cluster
`aws cloudformation update-stack --stack-name FargateFirelens --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_firelens.yaml`

# Delete the Fargate Cluster
`aws cloudformation delete-stack --stack-name FargateFirelens`
