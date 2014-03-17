# Overview
Running this template will demonstrate how to join multiple "Ref" statements into a single string. Suppose, for example, that you wish to join the Subnet IDs into a string which will be used for the "Subnets" property of a VPC ELB.

# Validate the Template

    aws cloudformation validate-template --template-body file://CFN_Join_Multiple_Refs_in_String.template

# Launch the Template

    aws cloudformation create-stack --stack-name test --template-body file://CFN_Join_Multiple_Refs_in_String.template