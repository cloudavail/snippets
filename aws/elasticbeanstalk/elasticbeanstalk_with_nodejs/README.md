# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that utilizes CPU Utilization (or some other metric allowed by AWS) instead of the default "NetworkOut" for autoscaling an elasticbeanstalk instance.

# Updating the Solution Stack

`aws elasticbeanstalk list-available-solution-stacks`

# Validate Stack

`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_nodejs.yaml`

# Create a EBwithANodeJsStack

`aws cloudformation create-stack --stack-name EBwithNodeJs --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_nodejs.yaml`

# Update a EBwithNodeJs Stack

`aws cloudformation update-stack --stack-name EBwithNodeJs --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_nodejs.yaml`

# Delete a EBwithNodeJs Stack

`aws cloudformation delete-stack --stack-name EBwithNodeJs`