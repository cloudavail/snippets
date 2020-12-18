# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that utilizes CPU Utilization (or some other metric allowed by AWS) instead of the default "NetworkOut" for autoscaling an elasticbeanstalk instance.

# Updating the Solution Stack

`aws elasticbeanstalk list-available-solution-stacks`

# Validate Stack

`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_application_load_balancer.yaml`

# Create a EBwithApplicationLoadBalancer Stack

`aws cloudformation create-stack --stack-name EBwithApplicationLoadBalancer --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_application_load_balancer.yaml`

# Update a EBwithApplicationLoadBalancer Stack

`aws cloudformation update-stack --stack-name EBwithApplicationLoadBalancer --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_application_load_balancer.yaml`

# Delete a EBwithApplicationLoadBalancer Stack

`aws cloudformation delete-stack --stack-name EBwithApplicationLoadBalancer`