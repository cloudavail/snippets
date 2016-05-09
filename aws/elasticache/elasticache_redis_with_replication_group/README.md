# Critical
The stack below is information only - the stack /will/ build two Elasticache Redis nodes in a Replication Group. The stack /will not/ place these nodes in two different availability zones - which means that this is /not/ suitable for Production use. A case has been filed with Amazon to discuss this issue.

# Overview
The purpose of this stack is to build two Elasticache Redis nodes in a Replication Group.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_redis_with_replication_group.json`

# Create an ECS Stack
`aws cloudformation create-stack --stack-name ElasticacheRedisReplicationGroup --template-body file://elasticache_redis_with_replication_group.json --region $region`

# Update an ECS Stack
`aws cloudformation update-stack --stack-name ElasticacheRedisReplicationGroup --template-body file://elasticache_redis_with_replication_group.json --region $region`

# Delete an ECS Stack
`aws cloudformation delete-stack --stack-name ElasticacheRedisReplicationGroup --region $region`
