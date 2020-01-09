# Overview

This snippet expirements with running containers via the AWS API. Specifically, the snippet attempts to use the AWS API to run the same container with different configurations - the ultimate idea being that the same container could be run with different commands.

# Example

Run: `python ecs_run_task_with_override_cmd_and_env.py` - this particular snippet includes an `environment` section that includes `ENVIRONMENT=test` - but this could be `ENVIRONMENT=test` for one run and `ENVIRONMENT=prod` for another run.
Result:

```
[root@ip-10-0-0-163 ~]# docker logs 394ebd8fc60a  
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=394ebd8fc60a
ECS_CONTAINER_METADATA_URI=http://169.254.170.2/v3/f2a38350-0dd5-44fd-8715-e8ad72d6dec9
AWS_EXECUTION_ENV=AWS_ECS_EC2
ENVIRONMENT=test
HOME=/root
```
