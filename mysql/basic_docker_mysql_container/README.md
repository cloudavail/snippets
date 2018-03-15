# Overview

The purpose of this snippet is to create a MySQL / Docker installation that runs a MySQL server.

# Build an Image

`docker build  -t basic_mysql .`

# Run an Image

`docker run -d --publish 3306:3306 basic_mysql`

# Login

Using an SQL client of your choice, login to localhost:3306 using username "root" and password "h8rCLzbBBA4h" (the password defined in your Dockerfile)
