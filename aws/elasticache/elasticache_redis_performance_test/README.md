# Overview
The purpose of this stack is to build an ElastiCache Redis cluster suitable for benchmarking.

# Validate CloudFormation
`aws cloudformation validate-template --template-body file://elasticache_redis_benchmarking.yaml`

# Create an ElasticacheRedisBenchmarking Stack
`aws cloudformation create-stack --stack-name ElasticacheRedisBenchmarking --template-body file://elasticache_redis_benchmarking.yaml`

# Update an ElasticacheRedisBenchmarking Stack
`aws cloudformation update-stack --stack-name ElasticacheRedisBenchmarking --template-body file://elasticache_redis_benchmarking.yaml`

# Delete an ElasticacheRedisBenchmarking Stack
`aws cloudformation delete-stack --stack-name ElasticacheRedisBenchmarking`

# Create an ElasticacheRedisBenchmarkingWithShards Stack
`aws cloudformation create-stack --stack-name ElasticacheRedisBenchmarkingWithShards --template-body file://elasticache_redis_benchmarking_with_shards.yaml`


`aws cloudformation update-stack --stack-name ElasticacheRedisBenchmarkingWithShards --template-body file://elasticache_redis_benchmarking_with_shards.yaml`

