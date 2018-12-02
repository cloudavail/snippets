# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that utilizes provides a "QA" and "Prod" environment. This setup allows code to be deployed first to "QA", tested and then the same code can be deployed to "Prod".

# Validate Stack
`aws cloudformation validate-template --template-body file://eb-cfn-php56.yaml`

# Create a BasicEBwithPHP5 Stack
`aws cloudformation create-stack --stack-name EBwithMultipleEnvs --template-body file://elasticbeanstalk_with_multiple_envs.yaml`

# Update a BasicEBwithPHP5 Stack
`aws cloudformation update-stack --stack-name EBwithMultipleEnvs --template-body file://elasticbeanstalk_with_multiple_envs.yaml`

# Delete a BasicEBwithPHP5 Stack
`aws cloudformation delete-stack --stack-name EBwithMultipleEnvs`
