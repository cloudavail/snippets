# Validate Stack

`aws cloudformation validate-template --template-body file://security_group_diff_by_env.yaml`

# Create SecurityGroupEnvTesting Stack in Dev

`aws cloudformation create-stack --stack-name SecurityGroupEnvTesting-Dev --parameters ParameterKey=Environment,ParameterValue=dev --template-body file://security_group_diff_by_env.yaml`

# Create SecurityGroupEnvTesting Stack in Prd

`aws cloudformation create-stack --stack-name SecurityGroupEnvTesting-Prd --parameters ParameterKey=Environment,ParameterValue=prd --template-body file://security_group_diff_by_env.yaml`

# Update A SecurityGroupEnvTesting Stack in Dev

`aws cloudformation update-stack --stack-name SecurityGroupEnvTesting-Dev --parameters ParameterKey=Environment,ParameterValue=dev --template-body file://security_group_diff_by_env.yaml`

# Update A SecurityGroupEnvTesting Stack in Prd

`aws cloudformation update-stack --stack-name SecurityGroupEnvTesting-Prd --parameters ParameterKey=Environment,ParameterValue=prod --template-body file://security_group_diff_by_env.yaml`

# Delete A SecurityGroupEnvTesting Stack in Dev

`aws cloudformation delete-stack --stack-name SecurityGroupEnvTesting-Dev`

# Delete A SecurityGroupEnvTesting Stack in Prd

`aws cloudformation delete-stack --stack-name SecurityGroupEnvTesting-Prd`
