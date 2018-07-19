# Overview
The CloudFormation file `basic_nlb_with_autoscaling.yaml` in this directory will create a Network Load Balancer and connect this with an Auto Scaling Group.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_nlb_with_autoscaling.yaml`

# Create NetworkLoadBalancerwithAutoScaling Stack
`aws cloudformation create-stack --stack-name NetworkLoadBalancerwithAutoScaling --template-body file://basic_nlb_with_autoscaling.yaml`

# Delete NetworkLoadBalancerwithAutoScaling Stack
`aws cloudformation delete-stack --stack-name NetworkLoadBalancerwithAutoScaling`
