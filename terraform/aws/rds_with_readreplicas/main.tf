provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "test_rds_security_group" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.1/32"]
  }

  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_db_option_group" "test_option_group" {
  name                     = "test-option-group"
  option_group_description = "Option group for Test"
  engine_name              = "mysql"
  major_engine_version     = "8.0"
}

resource "aws_db_parameter_group" "test_parameter_group" {
  name   = "test-parameter-group"
  family = "mysql8.0"
}

resource "aws_db_subnet_group" "test_db_subnet_group" {
  name       = "test-db-subnet-group"
  subnet_ids = ["${aws_subnet.publicsubnet01.id}", "${aws_subnet.publicsubnet02.id}"]
}

resource "random_string" "test_db_instance_password" {
  length = 24
  # (the default) may result in issues if special
  # characters are generated that are not acceptable as part of a MySQL random password
  special = false
}

resource "aws_db_instance" "test_db_instance" {
  allocated_storage           = 10
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
  backup_retention_period     = 1
  db_subnet_group_name        = "${aws_db_subnet_group.test_db_subnet_group.name}"
  deletion_protection         = false
  engine                      = "mysql"
  engine_version              = "8.0.11"
  instance_class              = "db.t3.small"
  identifier_prefix           = "test-"
  option_group_name           = "${aws_db_option_group.test_option_group.name}"
  username                    = "test"
  password                    = "${random_string.test_db_instance_password.result}"
  parameter_group_name        = "${aws_db_parameter_group.test_parameter_group.name}"
  skip_final_snapshot         = true
  storage_encrypted           = true
  storage_type                = "gp2"
  vpc_security_group_ids      = ["${aws_security_group.test_rds_security_group.id}"]
}

resource "aws_db_instance" "test_db_instance_read_replica" {
  count                       = "${var.read_replica_count}"
  # allocated_storage is not required if a replica
  # allow_major_version_upgrade = false
  # auto_minor_version_upgrade  = false
  # backup_retention_period must be greater than 0 if used as a read-replica source,
  # per https://www.terraform.io/docs/providers/aws/r/db_instance.html
  backup_retention_period     = 1
  # db_subnet_group_name = DbSubnetGroupName should not be specified for read replicas that are created in the same region as the master
  deletion_protection         = false
  engine                      = "mysql"
  engine_version              = "8.0.11"
  instance_class              = "db.t3.small"
  identifier_prefix           = "test-rr-"
  option_group_name           = "${aws_db_option_group.test_option_group.name}"
  # username is not required if a replica
  # password is not required if a replica
  parameter_group_name        = "${aws_db_parameter_group.test_parameter_group.name}"
  replicate_source_db         = "${aws_db_instance.test_db_instance.id}"
  skip_final_snapshot         = true
  storage_encrypted           = true
  storage_type                = "gp2"
  vpc_security_group_ids      = ["${aws_security_group.test_rds_security_group.id}"]
}