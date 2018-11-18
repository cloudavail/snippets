# Overview
The CloudFormation file `freebsd_aws_userdata.yaml` in this directory will create a FreeBSD instance that is configured using "cloudinit" and, in particular, run a "user-data" script to configure the FreeBSD instance.

# Validate Templates

`aws cloudformation validate-template --template-body file://freebsd_aws_userdata.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name FreeBSDwithUserData --template-body file://freebsd_aws_userdata.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name FreeBSDwithUserData --template-body file://freebsd_aws_userdata.yaml`

# Notes

I currently understand that the script that executes at first boot is `/usr/local/etc/rc.d/ec2_configinit` altough I'm unclear as to how exactly this script is executed. Of note it appears there is no mtehod to run this script on room as "KEYWORD: firstboot" is set within the script.
