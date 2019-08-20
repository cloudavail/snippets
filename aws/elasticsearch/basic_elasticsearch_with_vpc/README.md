# Overview
The CloudFormation file `basic_elasticsearch_with_vpc.yaml` in this directory will create a basic Elasticsearch cluster outside of a VPC.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_elasticsearch_with_vpc.yaml`

# Create Stack
`aws cloudformation create-stack --stack-name BasicElasticsearchWithVPC --template-body file://basic_elasticsearch_with_vpc.yaml`

# Update Stack
`aws cloudformation update-stack --stack-name BasicElasticsearchWithVPC --template-body file://basic_elasticsearch_with_vpc.yaml`

# Delete Stack
`aws cloudformation delete-stack --stack-name BasicElasticsearchWithVPC`
