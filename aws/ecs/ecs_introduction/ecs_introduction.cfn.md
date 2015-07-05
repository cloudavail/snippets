# Set Required Variables:

`region="us-west-2"`

`key_name="cjohnson"`

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecs_introduction.cfn.json --region $region`

# Create the VPC and Web Server Stack
`aws cloudformation create-stack --stack-name ecs-introduction --capabilities CAPABILITY_IAM --template-body file://ecs_introduction.cfn.json --region $region`

# Update the VPC and Web Server Stack
`aws cloudformation update-stack --stack-name ecs-introduction --capabilities CAPABILITY_IAM --template-body file://ecs_introduction.cfn.json`

# Delete the VPC and Web Server Stack
`aws cloudformation delete-stack --stack-name ecs-introduction --region $region`
