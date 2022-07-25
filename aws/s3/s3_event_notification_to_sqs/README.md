# Validate Template

`aws cloudformation validate-template --template-body file://s3_event_notification_to_sqs.yaml`

# Create Stack

`aws cloudformation create-stack --stack-name s3-event-notification-to-sqs  --template-body file://s3_event_notification_to_sqs.yaml`

# Update Stack

`aws cloudformation updatestack --stack-name s3-event-notification-to-sqs  --template-body file://s3_event_notification_to_sqs.yaml`

# Delete Stack

`aws cloudformation create-stack --stack-name s3-event-notification-to-sqs`