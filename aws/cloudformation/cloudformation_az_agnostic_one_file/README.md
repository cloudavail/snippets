# Overview

`aws cloudformation validate-template --template-body file://vpc.yaml`

# Create Stack Everywhere!

regions="ap-northeast-1 ap-northeast-2 ap-south-1 ap-southeast-1 ap-southeast-2 ca-central-1 eu-central-1 eu-west-1 eu-west-2 sa-east-1 us-east-1 us-east-2 us-west-1 us-west-2"

`for region in $regions; do \`
`  aws cloudformation create-stack --stack-name VPCAnywhere \`
`  --parameters file://params/$region.json --template-body file://vpc.yaml --region $region; \`
`done`

## Exceptional Regions

- us-west-1: us-west-1a does not support VPC subnets
- ap-northeast-1: ap-northeast-1a does not support VPC subnets

# Create Stack Everywhere, Select Edition!

`for region in $regions; do \`
`  aws cloudformation create-stack --stack-name VPCAnywhereSelectEdition \`
`  --parameters file://params_select/$region.json --template-body file://vpc_fn_select.yaml --region $region; \`
`done`