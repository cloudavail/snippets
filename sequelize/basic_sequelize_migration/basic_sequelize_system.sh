#!/usr/bin/env bash

apt update
apt -y install mysql-server

# the command below will allow the "root" user in the MySQL user database to login from any location
mysql -u 'root' -e "CREATE USER 'sequelize'@'%' IDENTIFIED BY 'my_password';"
mysql -u 'root' -e "GRANT ALL PRIVILEGES ON *.* TO 'sequelize'@'%' WITH GRANT OPTION;"
mysql -u 'root' -e "CREATE DATABASE database_development;"
# the command below will "bind" the MySQL server to all IP addresses
sed -i 's/^bind-address.*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

# install npm
apt -y install npm
npm install -g npx
