#!/usr/bin/env bash
# Name of the cloudformation stack
stackname="lambda-hello-world"
# The s3 bucket where the zipped lambda code will be sent.
s3bucket="rex-lambda-test"
# Path to the cloudformation file.
templatefile="serverless_function.yaml"
# Name/Path of the output from 'aws cloudformation package'
outputtemplatefile="transformed_serverless_function.yaml"


# Zips up the python file, uploads it to s3 bucket. Also transforms .yaml file into full fledged cloudformation file.
aws cloudformation package --template-file ${templatefile} \
                           --s3-bucket ${s3bucket} \
                           --output-template-file ${outputtemplatefile}

# Deploys stack from newly generated cloudformation file.
aws cloudformation deploy --template-file ${outputtemplatefile} \
                          --stack-name ${stackname} \
                          --capabilities CAPABILITY_IAM