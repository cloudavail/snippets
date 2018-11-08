# Overview

This CloudFormation file will create a Juniper VSRX appliance.

# Create the Juniper VSRX Stack

## Validate Template

`aws cloudformation validate-template --template-body file://juniper_basic_vsrx.yaml`

## Create Initial Stack
`aws cloudformation create-stack --stack-name JuniperVSRX --template-body file://juniper_basic_vsrx.yaml`

## Update Stack Using Rolling Update
`aws cloudformation delete-stack --stack-name JuniperVSRX`

# Accessing the Juniper VSRX

1. Locate the Elastic IP of the Juniper VSRX device (I used the AWS Console for this)
2. Login to the device as follows: `ssh -i ~/path/to/keyfile/junipervsrx.pem ec2-user@device_ip`
3. Once logged in, run the following commands:
  1. `configure` - the system will respond `Entering configuration mode`
  2. `set system root-authentication plain-text-password` - and enter your password twice
  3. `commit check` - to ensure your new configuration is good
  4. `commit`
4. At this point, you should be able to access the web user interface of the Juniper VSRX device at https://device_ip
5. The login will be "root" and the password will be the password you set previously.