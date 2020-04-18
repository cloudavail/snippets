# Overview

This template will create a Basic RDS Instance and an EC2 instance in an ASG that are both publicly accessible.

# Validate the Basic RDS Instance Template

`aws cloudformation validate-template --template-body file://basic_rds_instance_with_asg.yaml`

# Launch the Basic RDS Instance Stack

```
random_password=$(openssl rand -base64 12)
aws cloudformation create-stack --stack-name BasicRDSInstanceWithASG --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://basic_rds_instance_with_asg.yaml
```

# Update the Basic RDS Instance Stack

```
random_password=$(openssl rand -base64 12)
aws cloudformation update-stack --stack-name BasicRDSInstanceWithASG --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://basic_rds_instance_with_asg.yaml
```
