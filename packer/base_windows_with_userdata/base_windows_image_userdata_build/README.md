# Notes

1. Password in Code: there is a password field that is hardcoded in the given userdata files - this is a poor practice. I believe I'll be replacing with a call to AWS EC2Launch to allow the password to be retrieved via the Console or within another method.
2. Move to WinRM: the next portion of this project will involve enabling the WinRM communicator via userdata as using a "windows shell" provision and "WinRM" communicator is preferrable.
3. Remove "Shell Local": currently a shell-local provisioner exists to allow the machine running packer time to "pause" prior to stopping the given instance and snapshotting an AMI.

# Create the Packer Build VPC

This step assumes you've created a "Packer Build VPC" and made available the `$PACKER_VPC_ID` and `$PACKER_SUBNET_ID` variables.

# Run Packer

Validate the Packer File:
`packer validate windows_with_userdata.json`

Create an AMI:

`packer build windows_with_userdata.json`
