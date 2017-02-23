# Overview

This stack is a first attempt at having an Auto Scaling Group tag the EBS Volumes that are attached to EC2 Instances. Our initial pass will involve no tooling - but rather simply tagging the Auto Scaling Group itself with "PropogateAtLaunch" set to true.

# Validate Stack
`aws cloudformation validate-template --template-body file://autoscaling_with_tagging_of_ebs.yaml`

# Create AutoScalingWithYAML Stack
`aws cloudformation create-stack --stack-name AutoScalingwithTaggingofEBS --template-body file://autoscaling_with_tagging_of_ebs.yaml`
a