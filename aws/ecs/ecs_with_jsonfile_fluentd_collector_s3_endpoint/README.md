# Objective

The objective of this snippet is to create an ECS Cluster that utilizes both a fluentd collector pulling data from `json-file` and will write to an S3 Bucket.

# Setup

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://ecs_with_jsonfile_fluentd_collector_s3_endpoint.yaml`

## Create the ECS with json-file Fluentd Collector Stack

`aws cloudformation create-stack --stack-name ECSWithJSONFileFluentdCollectorToS3 --capabilities CAPABILITY_IAM --template-body file://ecs_with_jsonfile_fluentd_collector_s3_endpoint.yaml`

## Update the ECS with json-file Fluentd Collector Stack

`aws cloudformation update-stack --stack-name ECSWithJSONFileFluentdCollectorToS3 --capabilities CAPABILITY_IAM --template-body file://ecs_with_jsonfile_fluentd_collector_s3_endpoint.yaml`

## Delete the ECS with json-file Fluentd Collector Stack

`aws cloudformation delete-stack --stack-name ECSWithJSONFileFluentdCollectorToS3`

# Testing

## Ensure Logs are Being Gathered

1. Run `docker exec -it $container_id /bin/sh` where `$container_id` is the Container Id of the `fluentd` container.
2. Once inside this container, examine the logs in `/fluentd/log`
