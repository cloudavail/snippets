# Critical
The stack created by the file `elasticache_redis_with_replication_group.yaml` will produce two Elasticache Redis nodes in a Replication Group. There are two notes that need to be made regarding this file:

# Overview
The purpose of this stack is to build two Elasticache Redis nodes in a Replication Group.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_redis_with_replication_group.yaml`

# Create an ElasticacheRedisReplicationGroup Stack
`aws cloudformation create-stack --stack-name ElasticacheRedisReplicationGroup --template-body file://elasticache_redis_with_replication_group.yaml`

# Update an ElasticacheRedisReplicationGroup Stack
`aws cloudformation update-stack --stack-name ElasticacheRedisReplicationGroup --template-body file://elasticache_redis_with_replication_group.yaml`

# Delete an ElasticacheRedisReplicationGroup Stack
`aws cloudformation delete-stack --stack-name ElasticacheRedisReplicationGroup`
