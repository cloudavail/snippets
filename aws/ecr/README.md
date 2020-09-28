## Set Required Variables:
export AWS_PROFILE='cloudavail'

## Validate CloudFormation
`aws cloudformation validate-template --template-body file://ecr_scan.yaml`

## Create the ECS Cluster
`aws cloudformation create-stack --stack-name ecr --template-body file://ecr_scan.yaml`

### Upon Stack Creation
- subscribe to SNS topic (check spam folder)
- build docker image
- push to repo (push instructions are in the ecr repo UI)
- check email for notification

## Update the ECS Cluster
`aws cloudformation update-stack --stack-name ecr --capabilities CAPABILITY_IAM --template-body file://ecr_scan.yaml`

## Delete the ECS Cluster
`aws cloudformation delete-stack --stack-name ecr`