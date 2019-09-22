# Objective

The objective of this snippet is to create an group of servers that utilize the Code Deploy Server service.

# Setup CloudFormation Resources

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://basic_codedeploy_install.yaml`

## Create the Code Deploy Server Stack

`aws cloudformation create-stack --stack-name CodeDeployServerStack --capabilities CAPABILITY_IAM --template-body file://basic_codedeploy_install.yaml`


## Update the Code Deploy Server Stack

`aws cloudformation update-stack --stack-name CodeDeployServerStack --capabilities CAPABILITY_IAM --template-body file://basic_codedeploy_install.yaml`

## Delete the Code Deploy Server Stack

`aws cloudformation delete-stack --stack-name CodeDeployServerStack`

# Setup Application

## Push Application Revision

`aws deploy push --application-name HelloWorld --s3-location s3://cloudavail-codedeploys3bucket/helloworld-$(git rev-parse HEAD) --source ./files --description CodeDeployHelloWorld-Rev-$(git rev-parse HEAD)`

## Deploy Revision

Take the output from the previous step and run. An example is below:

`aws deploy create-deployment --application-name HelloWorld --s3-location bucket=cloudavail-codedeploys3bucket,key=helloworld-d5753d20d3355904ff54a11b652e0b14c565a2b1,bundleType=zip,eTag=efd61da80dead894d827fafeb286d4e3 --deployment-group-name CodeDeployServerDeploymentGroup --deployment-config-name CodeDeployDefault.OneAtATime --description CodeDeployHelloWorld-Rev-$(git rev-parse HEAD)`

# Deployment Actions

To be completed, but:

Files are written to: `/opt/codedeploy-agent/deployment-root/a2c81e48-2944-43e9-ae2d-b101f05ec39f/d-HKRBQS5ZB/`
