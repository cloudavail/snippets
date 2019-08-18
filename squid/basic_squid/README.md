# Overview
The CloudFormation file `basic_squid_infrastructure.json` in this directory will:

1. Create a Squid Proxy in a given AWS Region

# Validate the Template

`aws cloudformation validate-template --template-body file://basic_squid_infrastructure.json`

# Create a SquidProxy in a Given Region

`keyname=squid`
`region=eu-west-1`

`aws cloudformation create-stack --stack-name SquidProxy --template-body file://basic_squid_infrastructure.yaml --parameters ParameterKey=SquidProxyKeyName,ParameterValue=$keyname --region $region`

# Testing SquidProxy

1. Get IP
2. Curl IP with web request
`52.19.230.151`
curl --proxy http://localhost:3128 http://www.squid-cache.org/

curl --proxy http://52.19.230.151:3128 http://www.squid-cache.org/