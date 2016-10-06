# Validate CloudFormation
`aws cloudformation validate-template --template-body file://jenkins_on_aws_with_efs.json`

# Set Variables as Required:
Example variables are provided below:

- `keypair=jenkins`

# Create an JenkinswithEFS Stack
`aws cloudformation create-stack --stack-name JenkinswithEFS --template-body file://jenkins_on_aws_with_efs.json --parameters ParameterKey=KeyName,ParameterValue=$keypair`

# Create an JenkinswithEFS Change Set
`aws cloudformation create-change-set --stack-name JenkinswithEFS --change-set-name JenkinswithEFS-change-set-$(date +%s) --template-body file://jenkins_on_aws_with_efs.json --parameters ParameterKey=KeyName,ParameterValue=$keypair`


# Delete an JenkinswithEFS Stack
`aws cloudformation delete-stack --stack-name JenkinswithEFS`
