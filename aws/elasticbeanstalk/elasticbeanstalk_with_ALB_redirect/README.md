# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that redirects HTTP to HTTPS with a valid SSL Certification.

# Updating the Solution Stack

`aws elasticbeanstalk list-available-solution-stacks`

# Validate Stack

`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_ALB_redirect.yaml`

# Create a EBwithApplicationLoadBalancer Stack

`aws cloudformation create-stack --stack-name EBwithApplicationLoadBalancerRedirect --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_ALB_redirect.yaml`

# Update a EBwithApplicationLoadBalancer Stack

`aws cloudformation update-stack --stack-name EBwithApplicationLoadBalancerRedirect --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_ALB_redirect.yaml`

# Delete a EBwithApplicationLoadBalancer Stack

`aws cloudformation delete-stack --stack-name EBwithApplicationLoadBalancerRedirect`