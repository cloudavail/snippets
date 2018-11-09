# Overview

This CloudFormation file will create a Cisco ASAv appliance.

# Create the Cisco ASAv Stack

## Validate Template

`aws cloudformation validate-template --template-body file://cisco_basic_asav.yaml`

## Create Initial Stack
`aws cloudformation create-stack --stack-name CiscoASAv --template-body file://cisco_basic_asav.yaml`

## Update Stack Using Rolling Update
`aws cloudformation delete-stack --stack-name CiscoASAv`

# Accessing the Cisco ASAv

1. Locate the Elastic IP of the Cisco ASAv device (I used the AWS Console for this)
2. Login to the device as follows: `ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -i ~/path/to/keyfile/ciscoasav.pem admin@device_ip`. Note that `-oKexAlgorithms=+diffie-hellman-group1-sha1` resolves an issue where you are not able to login to the device - I did not investigate this issue deeply.

## Enabling HTTPS Access

Enabling HTTPS Access will allow you to download the ASDM management software from Cisco. The below was tested but has been written from memory.

`http server enable`
`http 0 0 management`

# Reference

- https://www.cisco.com/c/en/us/td/docs/security/asa/asa99/asav/quick-start/asav-quick/asav-aws.html
