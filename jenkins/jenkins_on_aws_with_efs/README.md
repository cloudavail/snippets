# Validate CloudFormation
`aws cloudformation validate-template --template-body file://jenkins_efs.yaml`
`aws cloudformation validate-template --template-body file://jenkins_autoscaling.yaml`


# Set Variables as Required:
Example variables are provided below:

- `keypair=jenkins`

# Create Jenkins Stacks

## Create a Jenkins EFS Stack
`aws cloudformation create-stack --stack-name JenkinsEFS --template-body file://jenkins_efs.yaml`

## Create a Jenkins Server Stack
`aws cloudformation create-stack --stack-name JenkinsServer --template-body file://jenkins_autoscaling.yaml --parameters ParameterKey=JenkinsServerKeyName,ParameterValue=$keypair`

# Create Jenkins Change Sets

## Create a Jenkins EFS Change Set
`aws cloudformation create-change-set --stack-name JenkinsEFS --change-set-name JenkinsEFS-change-set-$(date +%s) --template-body file://jenkins_efs.yaml`

## Create a Jenkins Server Change Set
`aws cloudformation create-change-set --stack-name JenkinsServer --change-set-name JenkinsServer-change-set-$(date +%s) --template-body file://jenkins_autoscaling.yaml --parameters ParameterKey=JenkinsServerKeyName,ParameterValue=$keypair`


# Delete an JenkinswithEFS Stack
`aws cloudformation delete-stack --stack-name JenkinswithEFS`
