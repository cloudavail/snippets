# Overview

This template will create a Postgres Based RDS Instance that is publicly accessible.

# Validate the Basic RDS Instance Template

`aws cloudformation validate-template --template-body file://ecs_run_task_with_db.yaml`

# Launch the Basic RDS Instance Stack

```
random_password=cloudavail123!
aws cloudformation create-stack --stack-name PostgresRDSInstanceRunTask --capabilities CAPABILITY_IAM --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://ecs_run_task_with_db.yaml
```

# Update the Basic RDS Instance Stack

```
random_password=cloudavail123!
aws cloudformation update-stack --stack-name PostgresRDSInstanceRunTask --capabilities CAPABILITY_IAM --parameters ParameterKey=DBInstanceMasterUserPassword,ParameterValue=$random_password --template-body file://ecs_run_task_with_db.yaml
```

# Notes
To run a docker image of the running postgres:
`docker run -it postgres psql --host $host_address --port 5432 --username test password=cloudavail123! --command="SELECT * FROM users`
- make sure RDS creates
- create a table in DB
```
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR (255),
        last_update DATE
);
```

# To Test
Run this command:
`aws ecs run-task --cluster ecs-run-task --task-definition postgresql:$number`

Check awslogs
- log group: `psql-logs`
- logs should select the "users" table in cloudwatch


