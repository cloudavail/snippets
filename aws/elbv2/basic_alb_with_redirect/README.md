# Note

This does not presently work with an "AWS::ElasticLoadBalancingV2::Listener" that has a DefaultAction of "redirect. The resulting error is "Encountered unsupported property RedirectConfig".

# Overview
The CloudFormation file `basic_alb_with_redirect.yaml` in this directory will create an Application Load Balancer that utilizes a redirect.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_alb_with_redirect.yaml`

# Create an ALBwithRedirect Stack
`aws cloudformation create-stack --stack-name ALBwithRedirect --template-body file://basic_alb_with_redirect.yaml`

# Update an ALBwithRedirect Stack
`aws cloudformation update-stack --stack-name ALBwithRedirect --template-body file://basic_alb_with_redirect.yaml`


# Delete ALBwithRedirect Stack
`aws cloudformation delete-stack --stack-name ALBwithRedirect`
