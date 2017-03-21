# Overview

This snippet tests what happens when you add a "condition" to an AWS resource.

# Create Stack

`aws cloudformation create-stack --stack-name CloudformationAddConditionTest --template-body file://cloudformation_wo_condition.yaml`

# Create Stack Change Set

`aws cloudformation create-change-set --stack-name CloudformationAddConditionTest --change-set-name CloudformationAddConditionTest-change-set-$(date +%s) --template-body file://cloudformation_w_condition.yaml`

# Outcome

This snippet has proves that a condition can be added to an existing resource.
