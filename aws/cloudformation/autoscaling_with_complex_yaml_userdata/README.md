# Objective
To create YAML flavor user-data that utilizes all of the following:

1. Uses an AWS Cloudformation Pseudo Parameter - specifically, AWS::Region (http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/pseudo-parameter-reference.html)
2. Uses an AWS CloudFormation Parameter (http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html)
3. Uses an AWS CloudFormation intrinsic function Fn::ImportValue

THe most typical use case here would be an Launch Configuration resource's "user-data" property that does the following:

1. Requires the use of the current AWS Region.
2. Uses a parameter that is passed in by the author of the CloudFormation stack.
3. Uses a value that is exported from another stack.

# Validate Stack
`aws cloudformation validate-template --template-body file://network_vpc.yaml`
`aws cloudformation validate-template --template-body file://webservers.yaml`

# Create AutoScalingWithYAML Stack
`aws cloudformation create-stack --stack-name NetworkVPC --template-body file://network_vpc.yaml`
`aws cloudformation create-stack --stack-name Webservers --template-body file://webservers.yaml`
