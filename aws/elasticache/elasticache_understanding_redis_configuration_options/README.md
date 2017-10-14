# Overview
The purpose of these stacks are to describe all possible ElastiCache options for Redis when running on AWS.

# Options

## Resource Types:
- AWS::ElastiCache::CacheCluster
- AWS::ElastiCache::ReplicationGroup

## Attributes for AWS::ElastiCache::CacheCluster
- AZMode: only available for Memcached cache clusters.
- NumCacheNodes: the number of cache nodes that the cache cluster should have.

## Attributes for AWS::ElastiCache::CacheCluster
- AutomaticFailoverEnabled
- NodeGroupConfiguration
  - ReplicaCount
  - Slots: AWS will set by default

# Evaluation:

Cost
Performance, Reads
Performance, Writes
Availability
Replication Lag

# Glossary:

- AWS::ElastiCache::CacheCluster: not defined at http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticache-cache-cluster.html
- AWS::ElastiCache::ReplicationGroup: A replication group is a collection of cache clusters, where one of the clusters is a primary read-write cluster and the others are read-only replicas.

# AWS::ElastiCache::CacheCluster

## Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_cachecluster_options.yaml`

## Create an ElastiCacheCacheCluster Stack
`aws cloudformation create-stack --stack-name ElastiCacheCacheCluster --template-body file://elasticache_cachecluster_options.yaml`

## Delete an ElastiCacheCacheCluster Stack
`aws cloudformation delete-stack --stack-name ElastiCacheCacheCluster`

# AWS::ElastiCache::ReplicationGroup

## Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_replicationgroup_options.yaml`

## Create an ElastiCacheReplicationGroup Stack
`aws cloudformation create-stack --stack-name ElastiCacheReplicationGroup --template-body file://elasticache_replicationgroup_options.yaml`

## Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_replicationgroup_nodegroups.yaml`

## Create an ElastiCacheReplicationGroup Stack
`aws cloudformation create-stack --stack-name ElastiCacheReplicationGroup --template-body file://elasticache_replicationgroup_nodegroups.yaml`
