# Overview
Running this template will demonstrate how to join multiple "Ref" statements into a single string.

# Validate the Template

    aws cloudformation validate-template --template-body file://join_multiple_refs_into_string.template

# Launch the Template

    aws cloudformation create-stack --stack-name test --template-body file://join_multiple_refs_into_string.template