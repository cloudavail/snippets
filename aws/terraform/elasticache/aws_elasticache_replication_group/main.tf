# aws_elasticache_replication_group requires resources
# aws_elasticache_parameter_group
# aws_security_group
# aws_elasticache_replication_group

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "public_subnet_01" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.0.0/25"
}

resource "aws_subnet" "public_subnet_02" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.0.128/25"
}

resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "public_aws_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table_association" "aws_route_table_association_public_subnet_01" {
  subnet_id      = "${aws_subnet.public_subnet_01.id}"
  route_table_id = "${aws_route_table.public_aws_route_table.id}"
}

resource "aws_route_table_association" "aws_route_table_association_public_subnet_02" {
  subnet_id      = "${aws_subnet.public_subnet_02.id}"
  route_table_id = "${aws_route_table.public_aws_route_table.id}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public_aws_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.aws_internet_gateway.id}"
}

resource "aws_elasticache_parameter_group" "elasticache_replication_group_parameter_group" {
  family = "redis3.2"
  #  Error creating Cache Parameter Group: InvalidParameterValue: The parameter CacheParameterGroupName is not a valid identifier. Identifiers must begin with a letter; must contain only ASCII letters, digits, and hyphens; and must not end with a hyphen or contain two consecutive hyphens.
  name   = "elasticache-replication-group-parameter-group"
  parameter {
    name  = "cluster-enabled"
    value = "yes"
  }
}

resource "aws_elasticache_subnet_group" "elasticache_replication_group_subnet_group" {
  # Error creating CacheSubnetGroup: InvalidParameterValue: The parameter CacheSubnetGroupName is not a valid identifier. Identifiers must begin with a letter; must contain only ASCII letters, digits, and hyphens; and must not end with a hyphen or contain two consecutive hyphens.
  name       = "elasticache-replication-group-subnet-group"
  subnet_ids = [ "${aws_subnet.public_subnet_01.id}", "${aws_subnet.public_subnet_02.id}" ]
}

resource "aws_security_group" "elasticache_replication_group_security_group" {
  vpc_id      = "${aws_vpc.vpc.id}"
  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol        = "-1"
    cidr_blocks     = ["127.0.0.1/32"]
  }
}

resource "aws_elasticache_replication_group" "elasticache_replication_group" {
  # should be named elasticache_replication_group but a name longer than 20 characters results in
  # aws_elasticache_replication_group.elasticache_replication_group: "replication_group_id" must contain from 1 to 20 alphanumeric characters or hyphens
  replication_group_id          = "ec-replication-group"
  replication_group_description = "elasticache_replication_group"
  node_type                     = "cache.m4.large"
  # automatic_failover_enabled "must be enabled for Redis (cluster mode enabled) replication groups"
  # per https://www.terraform.io/docs/providers/aws/r/elasticache_replication_group.html
  automatic_failover_enabled    = true
  auto_minor_version_upgrade    = false
  engine                        = "redis"
  engine_version                = "3.2.4"
  parameter_group_name          = "${aws_elasticache_parameter_group.elasticache_replication_group_parameter_group.id}"
  port                          = 6379
  subnet_group_name             = "${aws_elasticache_subnet_group.elasticache_replication_group_subnet_group.name}"
  security_group_ids            = [ "${aws_security_group.elasticache_replication_group_security_group.id}" ]
  cluster_mode {
    num_node_groups             = 2
    replicas_per_node_group     = 1
  }
}
