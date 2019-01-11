# Objective

To create a basic Elastic Beanstalk stack in CloudFormation that:

1. Utilizes a codebase for running a basic webserver.
2. Utilizes the same codebase for running a job on a regular schedule.

# Validate Stack
`aws cloudformation validate-template --template-body file://elasticbeanstalk_with_cron.yaml`

# Create a eb-with-cron Stack
`aws cloudformation create-stack --stack-name eb-with-cron --template-body file://elasticbeanstalk_with_cron.yaml`

# Update a eb-with-cron Stack
`aws cloudformation update-stack --stack-name eb-with-cron --template-body file://elasticbeanstalk_with_cron.yaml`

# Delete a eb-with-cron Stack
`aws cloudformation delete-stack --stack-name eb-with-cron`
