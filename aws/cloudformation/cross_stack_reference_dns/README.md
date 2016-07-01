# Validate Stacks
`aws cloudformation validate-template --template-body file://vpc_and_network.json`
`aws cloudformation validate-template --template-body file://elb_and_route53_recordset.json`

# Creates Stacks
You'll want to create the network stack first, followed by the web server stack.

`aws cloudformation create-stack --stack-name VPCandNetwork --template-body file://vpc_and_network.json`

`aws cloudformation create-stack --stack-name ELBwithRoute53RecordSet --parameters --template-body file://elb_and_route53_recordset.json --capabilities CAPABILITY_IAM`
