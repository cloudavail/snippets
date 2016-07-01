# Validate Stacks
`region='us-east-1'`
`aws cloudformation validate-template --template-body file://vpc_and_network.json --region $region`
`aws cloudformation validate-template --template-body file://webservers.json --region $region`

# Creates Stacks
You'll want to create the network stack first, followed by the web server stack.

`aws cloudformation create-stack --stack-name CrossStackVPC --template-body file://vpc_and_network.json --region $region`

`aws cloudformation create-stack --stack-name CrossStackWeb --parameters ParameterKey=CrossStackVPCName,ParameterValue=CrossStackVPC --template-body file://webservers.json --region $region --capabilities CAPABILITY_IAM`
