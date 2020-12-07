# Validate CloudFormation
`aws cloudformation validate-template --template-body file://fargate_firelens_splunk.yaml`

# Create the Fargate Cluster
`aws cloudformation create-stack --stack-name FargateFirelensSplunk --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_firelens_splunk.yaml`

# Update the Fargate Cluster
`aws cloudformation update-stack --stack-name FargateFirelensSplunk --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_firelens_splunk.yaml`

# Delete the Fargate Cluster
`aws cloudformation delete-stack --stack-name FargateFirelensSplunk`
