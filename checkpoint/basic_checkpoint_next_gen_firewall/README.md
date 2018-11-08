# Overview

This CloudFormation file will create a CloudGuard IaaS Next Gen Firewall & Threat Prevention appliance.

# Create the CheckPoint CloudGuard Next Gen Firewall Stack

## Validate Template

`aws cloudformation validate-template --template-body file://basic_checkpoint_next_gen_firewall.yaml`

## Create Stack
`aws cloudformation create-stack --stack-name CheckPointNextGenFirewall --template-body file://basic_checkpoint_next_gen_firewall.yaml`

## Delete Stack

`aws cloudformation delete-stack --stack-name CheckPointNextGenFirewall`

# Accessing the CheckPoint CloudGuard Appliance

1. Locate the Elastic IP of the CheckPointNextGenFirewall (I used the AWS Console for this)
2. Login to the device as follows: `ssh -i ~/path/to/keyfile/checkpoint.pem admin@device_ip`
3. Run the following command: `set user admin password`
4. Run `save config` and type `exit`
5. Login to the web console at https://device_ip using the username "admin" and password you set previously.

# Reference

- For login instructions: https://aws.amazon.com/marketplace/pp/B071GRLL8P