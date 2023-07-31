# Overview
The CloudFormation file `serverless_function.yaml` in this directory will create a serverless sample Lambda function.

## Launching stack via deploy.sh
Before running `./deploy.sh` follow the steps below.

1. Create an S3 Bucket to store Lambda code.
2. Enter name of that bucket in `deploy.sh` "s3bucket" variable.
3. Change the "stackname" variable in `deploy.sh` to your desired stack name.

## Test Function
1. Find the "HelloWorld" function in the AWS Lambda Console.
2. Get the trigger url under the _Configuration_ tab.
3. Run the HelloWorld function
    `trigger_url="TriggerUrlHere"`

    `curl -X POST ${trigger_url}`

## Check Output
1. Navigate back to the "HelloWorld" function in the AWS Lambda Console.
2. Find the _Monitor_ tab.
3. Click on _Logs_

<!-- What are we looking for here? What is the point of 'checking the output'? -->