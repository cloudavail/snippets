# Objective
The objective of this snippet is to create an ECS Service that utilizes two ELBs.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_two_elb_with_rule.yaml`

# Create the ECSwithTwoELBsandRule Stack
`aws cloudformation create-stack --stack-name ECSwithTwoELBs --capabilities CAPABILITY_IAM --template-body file://ecs_two_elb_with_rule.yaml`

# Update the ECSwithTwoELBsandRule Stack
`aws cloudformation update-stack --stack-name ECSwithTwoELBs --capabilities CAPABILITY_IAM --template-body file://ecs_two_elb_with_rule.yaml`

# Delete the ECSwithTwoELBsandRule Stack
`aws cloudformation delete-stack --stack-name ECSwithTwoELBs`