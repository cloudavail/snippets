# Overview

This CloudFormation file will create a Private Route53 Hosted Zone.

# How to Make the Zone Private?

Making the zone private (or public) is done by either including the "VPCs" property for the `AWS::Route53::HostedZone` type object. In our case, we include the "VPCs" property.

# Validate the Template

`aws cloudformation validate-template --template-body file://create_private_route53_zone.json`

# Launch the Template

`aws cloudformation create-stack --stack-name VPCWithPrivateRoute53Zone --template-body file://create_private_route53_zone.json`
