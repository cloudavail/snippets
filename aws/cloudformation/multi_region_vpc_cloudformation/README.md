# Overview
The file `file://multi_region_vpc_cloudformation_map.json` in this directory will create a VPC and subnets in any given AWS region.

# Why Not Use Fn::GetAzs?
Note that one additional file `multi_region_vpc_cloudformation_fngetazs-fails.json` is provided - this file _would_ be preferred with the exception of the fact that it cannot generate valid VPCs as a result of the "Fn::GetAZs" command returning Availability Zones where subnets can not be created.

# Validate the Template

`aws cloudformation validate-template --template-body file://multi_region_vpc_cloudformation_map.json`

# Launch the Template
## Create a VPC and Subnets in Default Region
`aws cloudformation create-stack --stack-name MultiRegionVPCMap --template-body file://multi_region_vpc_cloudformation_map.json`

## Create a VPC and Subnets in a Specified Region
`aws cloudformation create-stack --stack-name MultiRegionVPCMap --template-body file://multi_region_vpc_cloudformation_map.json --region us-east-1`
