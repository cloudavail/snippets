# Objective

The objective of this snippet is to create an OpenVPN AccessServer in an AWS VPC. The ultimate goal of this snippet is to provide a base for performing OpenVPN AccessServer prototyping.

# Setup OpenVPN AccessServer

## Validate CloudFormation

`aws2 cloudformation validate-template --template-body file://openvpn_access_server_ami.yaml`

## Create an OpenVPN AccessServer Stack

`aws2 cloudformation create-stack --stack-name openvpn-accessserver --template-body file://openvpn_access_server_ami.yaml`

## Update an OpenVPN AccessServer Stack

`aws2 cloudformation update-stack --stack-name openvpn-accessserver --capabilities CAPABILITY_IAM --template-body file://openvpn_access_server_ami.yaml`

## Delete an OpenVPN AccessServer Stack

`aws2 cloudformation delete-stack --stack-name openvpn-accessserver`

# Login to Server

`ssh -i ~/Downloads/openvpn-access-server.pem openvpnas@54.191.114.28`

# Run OpenVPN Configuration

`ovpn-init –ec2`
