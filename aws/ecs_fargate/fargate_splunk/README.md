# Validate CloudFormation
`aws cloudformation validate-template --template-body file://fargate_splunk.yaml`

# Create the Fargate Cluster
`aws cloudformation create-stack --stack-name FargatetoSplunk --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_splunk.yaml`

# Update the Fargate Cluster
`aws cloudformation update-stack --stack-name FargatetoSplunk --parameters --capabilities CAPABILITY_IAM --template-body file://fargate_splunk.yaml`

# Delete the Fargate Cluster
`aws cloudformation delete-stack --stack-name FargatetoSplunk`

---
# Working HEC Endpoint
`curl -k https://input-prd-p-wkz37khwtbs5.cloud.splunk.com:8088/services/collector -H "Authorization: Splunk $SPLUNK_TOKEN" -d '{"event": "Put this message in Splunk"}'`