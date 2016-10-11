# Validate Stacks
`aws cloudformation validate-template --template-body file://network_vpc.json`
`aws cloudformation validate-template --template-body file://webservers.json`

# Creates Stacks
You'll want to create the network stack first, followed by the web server stack.

`aws cloudformation create-stack --stack-name NetworkVPC --template-body file://network_vpc.json`

`aws cloudformation create-stack --stack-name Webservers --template-body file://webservers.json`
