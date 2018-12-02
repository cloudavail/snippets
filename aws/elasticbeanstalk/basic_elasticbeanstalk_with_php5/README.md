# Objective

To create a basic Elastic Beanstalk stack in CloudFormation.

# Validate Stack
`aws cloudformation validate-template --template-body file://eb-cfn-php56.yaml`

# Create a BasicEBwithPHP5 Stack
`aws cloudformation create-stack --stack-name BasicEBwithPHP5 --template-body file://basic_elasticbeanstalk_with_php5.yaml`

# Create a BasicEBwithPHP5 Stack
`aws cloudformation update-stack --stack-name BasicEBwithPHP5 --template-body file://basic_elasticbeanstalk_with_php5.yaml`

# Delete a BasicEBwithPHP5 Stack
`aws cloudformation delete-stack --stack-name BasicEBwithPHP5`
