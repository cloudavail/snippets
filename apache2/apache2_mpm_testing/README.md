# Validate CloudFormation
`aws cloudformation validate-template --template-body file://apache2_mpm_testing.yaml`

# Create Apache2 MPM Testing Stack
`aws cloudformation create-stack --stack-name apache2-testing --template-body file://apache2_mpm_testing.yaml`

# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name apache2-testing`
