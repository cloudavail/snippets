# Validate CloudFormation

`aws cloudformation validate-template --template-body file://fargate_scheduled_task.yaml`

# Create the Fargate Scheduled Task

`aws cloudformation create-stack --stack-name fargate-scheduled-task --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_scheduled_task.yaml`

# Update the Fargate Scheduled Task

`aws cloudformation update-stack --stack-name fargate-scheduled-task --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_scheduled_task.yaml`

# Delete the Fargate Scheduled Task

`aws cloudformation delete-stack --stack-name fargate-scheduled-task`
