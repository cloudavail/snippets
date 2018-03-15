# Overview

The purpose of this snippet is to create a MySQL / Docker installation that:

1. Runs a fresh database on every `docker run` - meaning previous data is cleared.

# Build an Image

`docker build  -t mysql_with_database .`

# Run an Image

`docker run -d --publish 3306:3306 mysql_with_database`

The MySQL server will be started and the database `world.sql` will be loaded.

# Modifications

If you `docker start/stop` the database server, modifications remain intact.
If you `docker restart` the database server, modifications remain intact.
If you `docker kill` followed by a `docker run` the database server will be reset to initial condition.

# Login

Using an SQL client of your choice, login to localhost:3306 using username "root" and password "h8rCLzbBBA4h" (the password defined in your Dockerfile)
