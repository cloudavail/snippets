# Overview

The CloudFormation file `basic_autoscaling_group.yaml` in this directory will:

# Validate Template

`aws cloudformation validate-template --template-body file://basic_autoscaling_group_windows.yaml`

# Create Stack

`aws cloudformation create-stack --stack-name basic-asg-windows --template-body file://basic_autoscaling_group_windows.yaml`

# Update Stack

`aws cloudformation update-stack --stack-name basic-asg-windows --template-body file://basic_autoscaling_group_windows.yaml`
