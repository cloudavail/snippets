# Overview:

This snippet attempts to describe what happens when an ELB is provided with a back-end instance with a self-signed certificate.

# Validate the ELB Backend Self-signed Cert Stack

`aws cloudformation validate-template --template-body file://elb_backend_selfsigned_cert.yaml`

# Create the ELB Backend Self-signed Cert Stack

`aws cloudformation create-stack --stack-name ELBWithSelfSignedCert --template-body file://elb_backend_selfsigned_cert.yaml`

# Delete the ELB Backend Self-signed Cert Stack

`aws cloudformation delete-stack --stack-name ELBWithSelfSignedCert`
