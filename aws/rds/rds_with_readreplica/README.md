# Overview

This template will create a Basic RDS Instance that is publicly accessible.

# Validate the RDS with Read Replica Stack

`aws cloudformation validate-template --template-body file://rds_with_readreplica.yaml`

# Launch the RDS with Read Replica Stack

`random_password=$(openssl rand -base64 12)`
`aws cloudformation create-stack --stack-name RDSwithReadReplica --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://rds_with_readreplica.yaml`

# Update the RDS with Read Replica Stack

`random_password=$(openssl rand -base64 12)`
`aws cloudformation update-stack --stack-name RDSwithReadReplica --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://rds_with_readreplica.yaml`

