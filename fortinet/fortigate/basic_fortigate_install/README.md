# Overview

This CloudFormation file will create a Fortinet Fortigate appliance.

# Create the Fortinet Fortigate Stack

## Validate Template

`aws cloudformation validate-template --template-body file://basic_fortigate_install.yaml`

## Create Initial Stack
`aws cloudformation create-stack --stack-name FortinetFortigate --template-body file://basic_fortigate_install.yaml`

## Update Stack Using Rolling Update
`aws cloudformation delete-stack --stack-name FortinetFortigate`

# Accessing the Fortinet Fortigate

1. Locate the Elastic IP of the Fortinet Fortigate device (I used the AWS Console for this)
2. Login to https://$device_ip with username "admin" and initial password the AWS Instance Id.

# Reference

- https://docs2.fortinet.com/vm/aws/fortigate/6.0/about-fortigate-for-aws/6.0.0/685891/overview
