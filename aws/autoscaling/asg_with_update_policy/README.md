# Overview
The CloudFormation file `asg_with_update_policy.json` in this directory will:

1. Create an Auto Scaling Group comprised on an EC2 instance.
2. Create a Block Device Mapping with a larger than default hard drive.

# Validate Templates

`aws cloudformation validate-template --template-body file://asg_with_update_policy_2016.yaml`
`aws cloudformation validate-template --template-body file://asg_with_update_policy_2017.yaml`

# Create Initial Stack
`aws cloudformation create-stack --stack-name ASGWithUpdatePolicy --template-body file://asg_with_update_policy_2016.yaml`

# Update Stack Using Rolling Update
`aws cloudformation update-stack --stack-name ASGWithUpdatePolicy --template-body file://asg_with_update_policy_2017.yaml`

# Testing During Rolling Update

Run the following:

`ab -c 1 -n 1000 http://$elb_url/`

Where $elb_url is the URL of the ELB behind which instances sit.
