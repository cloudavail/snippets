# Overview
Running this template will create:

1. a VPC that contains
2. an Auto Scaling Group with instances that have public IP addresses and can access the Internet
3. an Aurora DB Cluster
4. a MySQL Database Instance

# Validate the Template

`aws cloudformation validate-template --template-body file://vpc-with-rds-databases-and-asg.json`

# Launch the Template

`aws cloudformation create-stack --stack-name AuroraMySQLCompare --parameters ParameterKey=KeyName,ParameterValue=my_key --template-body file://vpc-with-rds-databases-and-asg.json --region us-west-2`