# Flow Logs
Flow logs will automatically be collected for every Elastic Network Interface in the created VPC.
The logs can be found in the AWS console under `Cloudwatch -> Logs -> "testVPCLogs"`
## Launch Stack
`$StackName='flow-logs-test-stack'`
`aws cloudformation create-stack --stack-name $StackName --template-body file://flow_logs.yaml --capabilities CAPABILITY_IAM`