# Overview
A bit lame - this works around the requirement to have multiple maps by breaking down what should be a multiple level nested map into two different maps.

# Validate the Template

`aws cloudformation validate-template --template-body file://nested_maps_workaround.json`

# Launch the Template

`aws cloudformation create-stack --stack-name NestMaps --template-body file://nested_maps_workaround.json`
