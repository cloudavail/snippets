# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that utilizes Elasticbeanstalk to listen on HTTPS.

# Updating the Solution Stack

`aws elasticbeanstalk list-available-solution-stacks`

# Validate Stack

`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_application_load_balancer_via_https.yaml`

# Create a EBwithApplicationLoadBalancerHTTPS Stack

`aws cloudformation create-stack --stack-name EBwithApplicationLoadBalancerHTTPS --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_application_load_balancer_via_https.yaml`

# Update a EBwithApplicationLoadBalancerHTTPS Stack

`aws cloudformation update-stack --stack-name EBwithApplicationLoadBalancerHTTPS --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_application_load_balancer_via_https.yaml`

# Delete a EBwithApplicationLoadBalancerHTTPS Stack

`aws cloudformation delete-stack --stack-name EBwithApplicationLoadBalancerHTTPS`