# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that utilizes CPU Utilization (or some other metric allowed by AWS) instead of the default "NetworkOut" for autoscaling an elasticbeanstalk instance.

# Updating the Solution Stack

`aws elasticbeanstalk list-available-solution-stacks`

# Validate Stack

`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_envvars.yaml`

# Create a EBwithEnvVars Stack

`aws cloudformation create-stack --stack-name EBwithEnvVars --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_envvars.yaml`

# Update a EBwithEnvVars Stack

`aws cloudformation update-stack --stack-name EBwithEnvVars --capabilities CAPABILITY_IAM --template-body file://elasticbeanstalk_with_envvars.yaml`

# Delete a EBwithEnvVars Stack

`aws cloudformation delete-stack --stack-name EBwithEnvVars`