# Overview
Running this template will create a VPC that contains an Auto Scaling Group with instances that have public IP addresses and can access the Internet.

# Validate the Template

    aws cloudformation validate-template --template-body file://vpc_two_subnets_asg_with_public_ip.template

# Launch the Template

    aws cloudformation create-stack --stack-name SampleVPC --parameters ParameterKey=KeyName,ParameterValue=my_key --template-body file://vpc_two_subnets_asg_with_public_ip.template