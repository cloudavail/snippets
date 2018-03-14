# Overview

The purpose of this snippet is to create a MySQL / Docker installation that:

1. Runs a fresh database on every `docker run` - meaning previous data is cleared.

# Build an Image

`docker build  -t basic_mysql .`

# Run an Image

`docker run -d --publish 3306:3306 basic_mysql`

# Login

Using an SQL client of your choice, login to localhost:3306 using username "root" and password "h8rCLzbBBA4h" (the password defined in your Dockerfile)
