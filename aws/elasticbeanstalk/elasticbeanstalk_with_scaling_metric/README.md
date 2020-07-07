# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that utilizes CPU Utilization (or some other metric allowed by AWS) instead of the default "NetworkOut" for autoscaling an elasticbeanstalk instance.

# Updating the Solution Stack

`aws elasticbeanstalk list-available-solution-stacks`

# Validate Stack

`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_scaling_metric.yaml`

# Create a BasicEBwithPHP Stack

`aws cloudformation create-stack --stack-name EBwithCPUUtilizationScaling --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_scaling_metric.yaml`

# Update a BasicEBwithPHP Stack

`aws cloudformation update-stack --stack-name EBwithCPUUtilizationScaling --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_scaling_metric.yaml`

# Delete a BasicEBwithPHP Stack

`aws cloudformation delete-stack --stack-name EBwithCPUUtilizationScaling`