# Critical
The stack created by the file `elasticache_redis_with_replication_group.json` will produce two Elasticache Redis nodes in a Replication Group. There are two notes that need to be made regarding this file:

1. There is a "mapping" section that describes the Availability Zones that should be used when building a subnets as well as resources that are contained within these subnets. This is as a result of the `Fn::GetAZs` Pseudo Parameters returning _all_ Availability Zones instead of just those subnets within a VPC. You may notice that the "A" Availability Zone maps to "us-east-1b" - this is because my own account does not allow subnets to be built in "us-east-1a."
2. The "AWS::ElastiCache::ReplicationGroup" utilizes a "PreferredCacheClusterAZs" property - this property "orders" the clusters as they are built - and orders them in the order of the given list. See: http://docs.amazonaws.cn/en_us/AmazonElastiCache/latest/CommandLineReference/CLIReference-cmd-CreateReplicationGroup.html.

# Overview
The purpose of this stack is to build two Elasticache Redis nodes in a Replication Group.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_redis_with_replication_group.json`

# Create an ElasticacheRedisReplicationGroup Stack
`aws cloudformation create-stack --stack-name ElasticacheRedisReplicationGroup --template-body file://elasticache_redis_with_replication_group.json`

# Update an ElasticacheRedisReplicationGroup Stack
`aws cloudformation update-stack --stack-name ElasticacheRedisReplicationGroup --template-body file://elasticache_redis_with_replication_group.json`

# Delete an ElasticacheRedisReplicationGroup Stack
`aws cloudformation delete-stack --stack-name ElasticacheRedisReplicationGroup`
