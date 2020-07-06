# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that utilizes provides a "QA" and "Prod" environment. This setup allows code to be deployed first to "QA", tested and then the same code can be deployed to "Prod".

# Updating the Solution Stack

`aws elasticbeanstalk list-available-solution-stacks`

# Validate Stack

`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_scaling_metric.yaml`

# Create a BasicEBwithPHP Stack

`aws cloudformation create-stack --stack-name EBwithMultipleEnvsandScalingMetric --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_scaling_metric.yaml`

# Update a BasicEBwithPHP Stack

`aws cloudformation update-stack --stack-name EBwithMultipleEnvsandScalingMetrics --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_scaling_metric.yaml`

# Delete a BasicEBwithPHP Stack

`aws cloudformation delete-stack --stack-name EBwithMultipleEnvsandScalingMetric`