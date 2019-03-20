#!/bin/bash

apt -y update

echo "mysql-server mysql-server/root_password password my_password" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password my_password" | debconf-set-selections

apt -y install mysql-server

sed -i "s/^bind-address/#bind-address/" /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -u root -pmy_password -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'my_password' WITH GRANT OPTION; FLUSH PRIVILEGES;"
service mysql restart
