# Objective
The objective of this snippet is to create an ECS Service that utilizes two ELBs.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_two_elb.yaml`

# Create the ECSwithTwoELBs Stack
`aws cloudformation create-stack --stack-name ECSwithTwoELBs --capabilities CAPABILITY_IAM --template-body file://ecs_two_elb.yaml`

# Update the ECSwithTwoELBs Stack
`aws cloudformation update-stack --stack-name ECSwithTwoELBs --capabilities CAPABILITY_IAM --template-body file://ecs_two_elb.yaml`

# Delete the ECSwithTwoELBs Stack
`aws cloudformation delete-stack --stack-name ECSwithTwoELBs`