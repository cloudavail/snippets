#!/bin/bash

apt -y update
apt-get -y install apache2

adduser testing --gecos "Test User" --disabled-password
echo "testing:password" | chpasswd

# ssh testing@192.168.50.2 -p 2022
