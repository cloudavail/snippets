# Validate CloudFormation

`aws cloudformation validate-template --template-body file://basic_documentdb.yaml`

# Create the DocumentDB Cluster

`aws cloudformation create-stack --stack-name basic-documentdb --template-body file://basic_documentdb.yaml`

# Delete the DocumentDB Cluster

`aws cloudformation delete-stack --stack-name basic-documentdb
