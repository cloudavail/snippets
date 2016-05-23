# Overview
To be written.

# Validate the Template

`aws cloudformation validate-template --template-body file://multi_region_and_account_vpc_cloudformation.json`

# Launch the Template

`aws cloudformation create-stack --stack-name MultiRegionAccountVPC --template-body file://multi_region_and_account_vpc_cloudformation.json`
