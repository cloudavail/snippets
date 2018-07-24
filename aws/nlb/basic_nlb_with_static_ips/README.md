# Overview
The CloudFormation file `basic_nlb_with_static_ips.yaml` in this directory will create a Network Load Balancer.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_nlb_with_static_ips.yaml`

# Create NetworkLoadBalancer Stack
`aws cloudformation create-stack --stack-name NetworkLoadBalancerStaticIPs --template-body file://basic_nlb_with_static_ips.yaml`

# Delete NetworkLoadBalancer Stack
`aws cloudformation delete-stack --stack-name NetworkLoadBalancerStaticIPs`
