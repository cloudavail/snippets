# Overview
The purpose of this stack is to build an ElastiCache Redis cluster suitable for testing writes to a cluster-mode enabled cluster.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_redis_cluster_write_test.yaml`

# Create an ElasticacheWriteTesting Stack
`aws cloudformation create-stack --stack-name ElasticacheWriteTesting --template-body file://elasticache_redis_cluster_write_test.yaml`

# Update an ElasticacheWriteTesting Stack
`aws cloudformation update-stack --stack-name ElasticacheWriteTesting --template-body file://elasticache_redis_cluster_write_test.yaml`

# Delete an ElasticacheWriteTesting Stack
`aws cloudformation delete-stack --stack-name ElasticacheWriteTesting`
