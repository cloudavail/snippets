# Validate CloudFormation
`aws cloudformation validate-template --template-body file://apache2_php_testing.yaml`

# Create Apache2 php Testing Stack
`aws cloudformation create-stack --stack-name apache2-php-testing --template-body file://apache2_php_testing.yaml`

# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name apache2-php-testing`
