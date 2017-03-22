# Overview

This snippet tests what happens when you change a value in an 

# Create Stack

`aws cloudformation create-stack --stack-name NetworkWithChangingParameters --parameters file://parameters/us-west-2_2az.json --template-body file://network.yaml`

# Create Stack Change Set

`aws cloudformation create-change-set --stack-name NetworkWithChangingParameters --change-set-name NetworkWithChangingParameters-change-set-$(date +%s) --parameters file://parameters/us-west-2_3az.json --template-body file://network.yaml`

# Outcome

This snippet has proves that a condition can be added to an existing resource.
