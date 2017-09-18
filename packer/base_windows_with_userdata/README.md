# Overview

The files within the `base_windows_with_userdata` directory are as follows:

1. A file `vpc_for_base_windows_packer_build.yaml` that will create a "Build VPC" for packer.
2. A userdata file (ending in `.ps1`) - this file contains a PowerShell script that will run when packer creates an image.
3. A packer file (ending in `.json`) - this file will create an AMI.

# Notes

1. Password in Code: there is a password field that is hardcoded in the given userdata files - this is a poor practice. I believe I'll be replacing with a call to AWS EC2Launch to allow the password to be retrieved via the Console or within another method.
2. Move to WinRM: the next portion of this project will involve enabling the WinRM communicator via userdata as using a "windows shell" provision and "WinRM" communicator is preferrable.
3. Remove "Shell Local": currently a shell-local provisioner exists to allow the machine running packer time to "pause" prior to stopping the given instance and snapshotting an AMI.

# Create the Packer Build VPC

## Validate Stack
`aws cloudformation validate-template --template-body file://vpc_for_base_windows_image.yaml`

## Create WindowsAWSBuild Stack
`aws cloudformation create-stack --stack-name VPCForWindowsBuild --template-body file://vpc_for_base_windows_image.yaml`

# Running Packer

## Export Required Variables for Packer

The variables below are, at present, required for the Packer builds.

`export AWS_ACCESS_KEY_ID=<insert here>`
`export AWS_SECRET_ACCESS_KEY=<insert here>`
`export PACKER_VPC_ID=<insert here>`
`export PACKER_SUBNET_ID=<insert here>`

## Run Packer

Validate the Packer File:
`packer validate windows_with_x_file.json`

Create an AMI:

`packer build windows_with_x_file.json`
