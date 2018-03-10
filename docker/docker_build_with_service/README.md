# Overview

The purpose of this snippet is to identify the cause of an issue where a service that is started is not available for use. In particular, if:

1. I run `service mysql start`
2. MySQL Server starts properly
3. I run mysql -u root -ppassword -e "CREATE DATABASE test_db"

I would receive a failure. This snippet seeks to help understand and resolve this behavior.
