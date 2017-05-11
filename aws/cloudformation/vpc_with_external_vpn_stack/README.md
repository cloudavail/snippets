# Overview
The CloudFormation files `vpc.yaml` and `vpn.yaml` will create a VPC stack as well as a VPN stack. You might want to do this if you are going to create a stack with a number of different VPNs.

# Validate the Templates

`aws cloudformation validate-template --template-body file://vpc.yaml`

`aws cloudformation validate-template --template-body file://vpn.yaml`


# Create a VPC and Subnets in Default Region

`aws cloudformation create-stack --stack-name vpc --template-body file://vpc.yaml`

`aws cloudformation create-stack --stack-name vpn --template-body file://vpn.yaml`
