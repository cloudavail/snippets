# Overview
The CloudFormation file `basic_alb_with_asg.yaml` in this directory will create an Application Load Balancer that passed traffic to an ASG.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_alb_with_asg.yaml`

# Create an ALBwithASGTargetGroup Stack
`aws cloudformation create-stack --stack-name ALBwithASGTargetGroup --template-body file://basic_alb_with_asg.yaml`

# Update an ALBwithASGTargetGroup Stack
`aws cloudformation update-stack --stack-name ALBwithASGTargetGroup --template-body file://basic_alb_with_asg.yaml`


# Delete ALBwithASGTargetGroup Stack
`aws cloudformation delete-stack --stack-name ALBwithASGTargetGroup`
