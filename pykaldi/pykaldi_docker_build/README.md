# Overview

The CloudFormation file `pykaldi_docker_build.yaml` will attempt to create the infrastructure neccesary to perform a pykaldi Docker Build.

# Validate Templates

`aws cloudformation validate-template --template-body file://pykaldi_docker_build.yaml`

# Create Initial Stack

`aws cloudformation create-stack --stack-name pykaldi-build --template-body file://pykaldi_docker_build.yaml`
