#!/usr/bin/env bash

debconf-set-selections <<< 'ntop ntop/interfaces string eth0'
debconf-set-selections <<< 'ntop ntop/admin_password password nothing'
debconf-set-selections <<< 'ntop ntop/admin_password_again password nothing'

sudo apt-get -y install ntop

ntop -d