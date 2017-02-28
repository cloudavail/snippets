# Overview

# Validate the Template

`aws cloudformation validate-template --template-body file://encrypted_rds.yaml`

# Launch the Template

## Create a Password for RDS Instance
rds_password=$(openssl rand -base64 12)
echo $rds_password

## Create RDS Stack
`aws cloudformation create-stack --stack-name RDSwithEncryptedStorage --parameters ParameterKey=RDSMasterUserPassword,ParameterValue=$rds_password --template-body file://encrypted_rds.yaml`
