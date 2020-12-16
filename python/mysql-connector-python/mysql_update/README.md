# Overview

This snippet will perform an "update" on a MySQL database.

# Start a MySQL Server

The command below will start a MySQL Server using Docker.

```
export MYSQL_ROOT_PASSWORD=$(openssl rand -base64 12)
echo "MySQL Password: $MYSQL_ROOT_PASSWORD"
docker run --publish 3306:3306 \
  --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  --env MYSQL_DATABASE=test \
  mysql:latest
```
