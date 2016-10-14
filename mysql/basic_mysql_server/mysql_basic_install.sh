#!/bin/bash

apt -y update

echo "mysql-server mysql-server/root_password password my_password" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password my_password" | debconf-set-selections

apt -y install mysql-server
