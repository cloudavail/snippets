# Overview

This template does not work - it attempts to create a Read Replica Aurora Cluster in the Same Region as the Source.

# Validate the Basic RDS Instance Template

`aws cloudformation validate-template --template-body file://basic_aurora_cluster_read_replica.yaml`

# Launch the Basic RDS Instance Stack

`random_password=$(openssl rand -base64 12)`
`aws cloudformation create-stack --stack-name BasicAuroraClusterWithReadReplica --parameters ParameterKey=AuroraDBMasterUserPassword,ParameterValue=$random_password --template-body file://basic_aurora_cluster_read_replica.yaml`

# Update the Basic RDS Instance Stack

`random_password=$(openssl rand -base64 12)`
`aws cloudformation update-stack --stack-name BasicAuroraClusterWithReadReplica --parameters ParameterKey=AuroraDBMasterUserPassword,ParameterValue=$random_password --template-body file://basic_aurora_cluster_read_replica.yaml`
