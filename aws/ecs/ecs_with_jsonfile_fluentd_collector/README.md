# Objective

The objective of this snippet is to create an ECS Cluster that utilizes both a fluentd collector pulling data from `json-file` log output sources.

# Setup

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://ecs_with_jsonfile_fluentd_collector.yaml`

## Create the ECS with json-file Fluentd Collector Stack

`aws cloudformation create-stack --stack-name ECSWithJSONFileFluentdCollector --capabilities CAPABILITY_IAM --template-body file://ecs_with_jsonfile_fluentd_collector.yaml`

## Update the ECS with json-file Fluentd Collector Stack

`aws cloudformation update-stack --stack-name ECSWithJSONFileFluentdCollector --capabilities CAPABILITY_IAM --template-body file://ecs_with_jsonfile_fluentd_collector.yaml`

## Delete the ECS with json-file Fluentd Collector Stack
`aws cloudformation delete-stack --stack-name ECSWithJSONFileFluentdCollector`

# Testing

## Ensure Logs are Being Gathered

1. Run `docker exec -it $container_id /bin/sh` where `$container_id` is the Container Id of the `fluentd` container.
2. Once inside this container, examine the logs in `/fluentd/log`

## Ensure Records are Being Transformed

By default, adding "Log Driver Options" such as `env` or `labels` adds these items as `attrs` within the log file. The fluentd system can modify records to copy or move values within `attrs` to the root of a given log entry or record.

# Issues

## Unknown Placeholder Error
`#0 unknown placeholder` errors are present with a majority of configurations of the "record" configuration. I eventually gave up in trying to determine the cause of these errors or understand the documentation (this implementation wasn't for production work) and opted to use `enably_ruby` resolves these issues. See below for a working configuration.

```
<filter docker.**>
  @type record_transformer
  enable_ruby
  <record>
    # if available, this extracts ["attrs"]["CONTAINER_NAME"]
    container_name \${!record.dig("attrs","CONTAINER_NAME")}
  </record>
</filter>
```
