# Validate Stacks
`aws cloudformation validate-template --template-body file://hosted_zone.yml`
`aws cloudformation validate-template --template-body file://hosted_zone_export.yml`

# Creates Stacks
You'll want to create the Hosted Zone stack first, followed by the Hosted Zone export stack.

## Create Initial Stack

`aws cloudformation create-stack --stack-name HostedZone --region us-west-2 --template-body file://hosted_zone.yml`

## Get Stack Values

`hosted_zone_id=$(aws cloudformation list-exports --query 'Exports[?Name==`HostedZone-HostedZoneId`].[Value]' --region us-west-2 --output text)`

`hosted_zone_name=$(aws cloudformation list-exports --query 'Exports[?Name==`HostedZone-HostedZoneName`].[Value]' --region us-west-2 --output text)`

## Echo Stack Values

`echo $hosted_zone_id`

`echo $hosted_zone_name`

## Create "Export" Stack

`aws cloudformation create-stack --parameters ParameterKey=HostedZoneId,ParameterValue=$hosted_zone_id ParameterKey=HostedZoneName,ParameterValue=$hosted_zone_name --stack-name HostedZoneExport --region us-west-1 --template-body file://hosted_zone_export.yml`
