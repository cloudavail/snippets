# Overview

This snippet will create an event bus and put events on the created bus.

# Manage the EventBus CloudFormation Stack

## Validate Stack

`aws cloudformation validate-template --template-body file://basic_eventbus_with_rule.yaml`

## Create Stack

`aws cloudformation create-stack --stack-name basic-eventbus-with-rule --template-body file://basic_eventbus_with_rule.yaml`

## Update Stack

`aws cloudformation update-stack --stack-name basic-eventbus-with-rule --template-body file://basic_eventbus_with_rule.yaml`

## Delete Stack

`aws cloudformation update-stack --stack-name basic-eventbus-with-rule`

# Put an Event

`aws events put-events --entries file://sample_ec2_events.json`
