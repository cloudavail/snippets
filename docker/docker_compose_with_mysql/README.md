# Overview

The purpose of this snippet is to provide a basic platform for testing the MySQL docker image.

# Starting the Docker MySQL Container

The `mysql` Docker container makes an assumption that you provide the `MYSQL_ROOT_PASSWORD` enviornment variable. Set this first (or you can also set in an `.env` file). An example is below:

`MYSQL_ROOT_PASSWORD='password'`

## In Foreground

`docker-compose up mysql`

## In Background

`docker-compose up --detach mysql`

# Starting the Docker MySQL Container

`docker-compose stop mysql`

# Connecting to the Docker MySQL Container

Assuming you have the `mysql` command-line utility installed, you can run the following: `mysql -u root -h 127.0.0.1 -p` and then enter the `MYSQL_ROOT_PASSWORD` environment variable you set previously.
