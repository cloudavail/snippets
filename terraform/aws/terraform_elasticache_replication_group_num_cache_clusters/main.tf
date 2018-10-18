provider "aws" {}

resource "aws_elasticache_parameter_group" "test_elasticache_parameter_group" {
  family = "redis3.2"
  name   = "test-elasticache-parameter-group"
}

resource "aws_elasticache_subnet_group" "test_elasticache_subnet_group" {
  name       = "test-elasticache-subnet-group"
  subnet_ids = [
    "${aws_subnet.private_subnet_01.id}",
    "${aws_subnet.private_subnet_02.id}" 
  ]
}

resource "aws_security_group" "test_elasticache_security_group" {
  description = "test-elasticache-security-group"
  name        = "test-elasticache-security-group"
  vpc_id      = "${aws_vpc.vpc.id}"
  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    cidr_blocks     = ["127.0.0.1/32"]
  }
  # as a managed service the elasticache cluster should never be able to initiate an outbound request
  # this egress rule prevents that from happening
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["127.0.0.1/32"]
  }
}

resource "aws_elasticache_replication_group" "test-elasticache-replication-group" {
  # replication_group_id = must be less then 20 characters
  replication_group_id          = "test-elasticache-rg"
  replication_group_description = "test elasticache replication group num cache clusters"
  node_type                     = "cache.m4.large"
  number_cache_clusters         = 2
  automatic_failover_enabled    = true
  auto_minor_version_upgrade    = false
  engine                        = "redis"
  engine_version                = "3.2.4"
  parameter_group_name          = "${aws_elasticache_parameter_group.test_elasticache_parameter_group.name}"
  subnet_group_name             = "${aws_elasticache_subnet_group.test_elasticache_subnet_group.name}"
  security_group_ids            = [ "${aws_security_group.test_elasticache_security_group.id}" ]
}
