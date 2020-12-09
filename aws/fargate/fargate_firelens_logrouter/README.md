# Validate CloudFormation
`aws cloudformation validate-template --template-body file://fargate_firelens.yaml`

# Create the Fargate Cluster
`aws cloudformation create-stack --stack-name FargateFirelensLogRouter --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_firelens_logrouter.yaml`

# Update the Fargate Cluster
`aws cloudformation update-stack --stack-name FargateFirelensLogRouter --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_firelens_logrouter.yaml`

# Delete the Fargate Cluster
`aws cloudformation delete-stack --stack-name FargateFirelensLogRouter`
