# Overview
The CloudFormation file `alb_with_ssl_policy.yaml` in this directory will create an Application Load Balancer that utilizes an SSL Policy.
# Validate Templates

`aws cloudformation validate-template --template-body file://alb_with_ssl_policy.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name ALBwithSSLPolicy --template-body file://alb_with_ssl_policy.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name ALBwithSSLPolicy --template-body file://alb_with_ssl_policy.yaml`

# Delete Stack
`aws cloudformation delete-stack --stack-name ALBwithSSLPolicy`

# Describing ELBv2 SSL Policies:

`aws elbv2 describe-ssl-policies`

# Testing Connectivity

