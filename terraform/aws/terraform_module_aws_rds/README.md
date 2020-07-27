# Overview

# Create RDS Database using Module

The DB Subnet must exist _prior_ to building the RDS instance - I not determined if this is, factual or a bug in terraform or module, as it seems likely that a resource that depends on another should _not_ require terraform targeting.

Setup the DB Subnet Group

`terraform apply -target=aws_db_subnet_group.db_subnet_group`

Setup the Database

`terraform apply`
