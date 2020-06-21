#!/bin/bash

apt update
apt -y install mysql-server

# the command below will allow the "root" user in the MySQL user database to login from any location
mysql -u 'root' -e "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY 'my_password' WITH GRANT OPTION;"
# the command below will "bind" the MySQL server to all IP addresses
sed -i 's/^bind-address.*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# systemctl restart mysql
