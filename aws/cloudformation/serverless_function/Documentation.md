#Launching stack
##deploy.sh
Before running `./deploy.sh` follow the steps below.
###S3 Bucket:
Create an S3 Bucket to store Lambda code.

Enter name of that bucket in `deploy.sh` "s3bucket" variable.
###Name your stack:
Change the "stackname" variable in `deploy.sh` to your desired stack name.

#Testing Function
##Lambda Function
Find the "HelloWorld" function in the AWS Lambda Console.

Get the trigger url.
##Run the HelloWorld function
`trigger_url="TriggerUrlHere"`

`curl -X POST ${trigger_url}`
##Check Output
Navigate back to the "HelloWorld" function in the AWS Lambda Console.

Find the "Monitoring" tab.

Click "Jump To Logs"