#!/bin/bash

apt-get -y update

echo "mysql-server mysql-server/root_password password my_password" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password my_password" | debconf-set-selections

apt-get -y install mysql-server