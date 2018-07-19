# Overview
The CloudFormation file `basic_nlb.yaml` in this directory will create a Network Load Balancer.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_nlb.yaml`

# Create NetworkLoadBalancer Stack
`aws cloudformation create-stack --stack-name NetworkLoadBalancer --template-body file://basic_nlb.yaml`

# Delete NetworkLoadBalancer Stack
`aws cloudformation delete-stack --stack-name NetworkLoadBalancer`
