# Overview

This snippet is intended to establish the baseline knowledge necessary to set up Liquibase and perform basic operations.


# Setting up

## Install Liquibase

- Instructions to install can be found here: https://docs.liquibase.com/install/home.html

* Note that you may need to download additional drivers, depending on your database.


# Getting started

1. Run the following command to create a new project: `liquibase init project`
- this will create the files within your project that Liquibase needs to operate

2. In the liquibase.properties file, enter the following information:
  - name and location of your changelog file (changelog.sql by default)
  - database connection url
  - database username
  - database password

  Additional properties can be found here: https://docs.liquibase.com/concepts/connections/creating-config-properties.html


# Basic operations

## The changelog file
  The changelog is the file where schema changes will be defined, in the form of changesets. Each changelog file must begin with the following line:
    `--liquibase formatted sql`

## Changesets
Changesets are added to the changelog file.

- Each changeset must be preceded by an author and a unique id
  - example: `--changeset joe:change1`
- A rollback statement should  also included. This is the SQL statement that Liquibase will run when a `rollback` command is executed
  - example: `--rollback ALTER TABLE burgers DROP pickles;`
- Additional changeset properties can be found here: https://docs.liquibase.com/concepts/changelogs/sql-format.html

## Updating database schema

Once you've added your changesets to the changelog, run the following commands:

`liquibase tag $yourtag` - this creates a snapshot of the database schema that can be used for rollbacks
`liquibase update` - this validates the changeset
`liquibase update-sql` - this executes the changeset

Changes are tracked in a new table in the database, DATABASECHANGELOG. If this table does not already exist, Liquibase will create it. A second table, DATABASECHANGELOGLOCK, is also created to prevent conflicts with other callers to the database.

## Rollbacks

To rollback using a tag:
`liquibase rollback $tag`

Other rollback options are detailed here: https://docs.liquibase.com/commands/home.html#database-rollback-commands


 ------
